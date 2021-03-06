% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vif.gam.R
\name{vif.gam}
\alias{vif.gam}
\title{Variance Inflation Factor}
\usage{
vif.gam(object)
}
\arguments{
\item{object}{An object of class gam}
}
\value{
VIF.df A data frame consisting of the VIF values for each parametric
term in a fitted Generalised Additive Model
}
\description{
This function takes a fitted mgcv model object and returns a data frame of
variance inflation factors
}
\examples{

library(mgcv)
library(dplyr)

set.seed(101)
N <- 100
x1 <- runif(n=N)
x2 <- runif(n=N)
x3 <- runif(n=N) + 0.9*x1 - 1.75*x2

df <- data.frame(x1 = x1,
                 x2 = x2,
                 x3 = x3) \%>\%
  mutate(y = rnorm(n=N,
                   mean = 1 - 2*x1 + 3*x2 - 0.5*x3,
                   sd = 0.5))

fit1 <- gam(data=df, y ~ x1 + x2 + x3)

summary(fit1)

vif.gam(fit1)

}
