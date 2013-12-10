\name{rv}
\alias{rv}
\title{Make a dscicrete random variable.}
\usage{
  rv(x, probs = NULL)
}
\arguments{
  \item{x}{a numberic vector giving the values of the
  random vairalbe.}

  \item{probs}{optional, a numeric vector giving the
  probabilities corresponding to each x value.  If not
  specific, assumes all outcomes are equally likely}
}
\description{
  Make a dscicrete random variable.
}
\examples{
dice <- rv(1:6)
P(dice > 3)
E(dice)
P(dice > dice + 1)
}

