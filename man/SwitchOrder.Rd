% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Utilities.R
\name{SwitchOrder}
\alias{SwitchOrder}
\title{arrange cluster member numbers from largest to smallest}
\usage{
SwitchOrder(Bestcl, NClust)
}
\arguments{
\item{Bestcl}{fclust object}

\item{NClust}{Number of clusters}
}
\value{
fclust object with reorder clusters
}
\description{
arrange cluster member numbers from largest to smallest
}
\examples{
# Generate some random data
data <- matrix(rnorm(seq_len(1000)), nrow=100)
# Run clustering
clres <- vsclust_algorithm(data, centers=5, m=1.5)
clres <- SwitchOrder(clres, 5)
}
