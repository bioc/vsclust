FROM rocker/shiny:4.6.1

LABEL maintainer="Veit Schwaemmle <veits@bmb.sdu.dk>"
LABEL description="Docker image of VSClust on top of Shiny Server."

# System dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        default-jdk \
        libglpk-dev \
        libuv1t64 \
        libuv1-dev \
        libpq-dev  \
        r-cran-rjava \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#RUN R CMD javareconf

# Install package managers
RUN R -e "install.packages( \
    c('BiocManager', 'remotes'), \
    repos = 'https://cloud.r-project.org' \
)"

# Explicitly select the Bioconductor release matching R 4.6
#RUN R -e "BiocManager::install( \
#    ask = FALSE, \
#    update = FALSE \
#)"

# Install Bioconductor and CRAN dependencies before VSClust
RUN R -e "BiocManager::install( \
    c( \
        'clusterProfiler', \
        'DOSE', \
        'MultiAssayExperiment', \
        'genefilter', \
        'qvalue', \
        'limma', \
        'graph', \
        'GOstats', \
        'Category', \
        'RBGL', \
        'Rcpp', \
        'matrixStats', \
        'yaml', \
        'shinyjs', \
        'shinythemes', \
        'DT', \
        'RJDBC', \
        'dplyr', \
        'plotly', \
        'RPostgreSQL', \
        'lubridate' \
    ), \
    ask = FALSE, \
    update = FALSE \
)"

# Fail early if important dependencies are unavailable
#RUN R -e "stopifnot( \
#    requireNamespace('clusterProfiler', quietly = TRUE), \
#    requireNamespace('DOSE', quietly = TRUE) \
#)"

# Copy and install the current local VSClust source
COPY . /srv/shiny-server/vsclust

RUN R CMD INSTALL /srv/shiny-server/vsclust

#COPY inst/other/RDAVIDWebService_1.28.0.tar.gz .
#RUN R CMD INSTALL RDAVIDWebService_1.28.0.tar.gz
RUN bash


RUN rm -rf /srv/shiny-server
RUN mkdir /srv/shiny-server
COPY inst/shiny/*  /srv/shiny-server/
COPY inst/shiny/www /srv/shiny-server/www

# installing customized library
COPY .  /srv/shiny-server/vsclust
RUN R CMD INSTALL /srv/shiny-server/vsclust
