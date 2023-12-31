% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/EvaluateClustering.R
\name{mfuzz.plot}
\alias{mfuzz.plot}
\title{Plotting vsclust results}
\usage{
mfuzz.plot(
  dat,
  cl,
  mfrow = c(1, 1),
  colo,
  minMem = 0,
  timeLabels,
  filename = NA,
  xlab = "Time",
  ylab = "Expression changes"
)
}
\arguments{
\item{dat}{a numeric data matrix containing the values used in the clustering}

\item{cl}{clustering results from vsclust_algorithm or Bestcl object from 
clustComp function}

\item{mfrow}{vector of two numbers for the number of rows and colums, figure 
panels are distributed in the plot}

\item{colo}{color map to be used (can be missing)}

\item{minMem}{filter for showing only features with a higher membership 
values than this value}

\item{timeLabels}{alternative labels for different conditions}

\item{filename}{for writing into pdf. Will write on screen when using NA}

\item{xlab}{Label of x-axis}

\item{ylab}{Label of y-axis}
}
\value{
Multiple panels showing expression profiles of clustered features 
passing the minMem threshold
}
\description{
This function visualizes the clustered quantitative profiles in multiple 
figure panels. The parameters allow specifying the main items like axes 
labels and color maps. The code is adopted from the MFuzz package.
}
\examples{
#' # Generate some random data
data <- matrix(rnorm(seq_len(5000)), nrow=500)
# Run clustering
clres <- vsclust_algorithm(data, centers=2, m=1.5)
mfuzz.plot(data, clres,  mfrow=c(2,3), minMem=0.0)
}
\references{
Schwaemmle V, Jensen ON. VSClust: feature-based variance-sensitive clustering 
of omics data. Bioinformatics. 2018 Sep 1;34(17):2965-2972. doi: 
10.1093/bioinformatics/bty224. PMID: 29635359.

Schwaemmle V, Hagensen CE. A Tutorial for Variance-Sensitive Clustering and 
the Quantitative Analysis of Protein Complexes. Methods Mol Biol. 
2021;2228:433-451. doi: 10.1007/978-1-0716-1024-4_30. PMID: 33950508.

Schwaemmle V, Jensen ON. A simple and fast method to determine the parameters 
for fuzzy c-means cluster analysis. Bioinformatics. 
2010 Nov 15;26(22):2841-8. doi: 10.1093/bioinformatics/btq534. Epub 2010 Sep 
29. PMID: 20880957.
}
