\name{moments}
\alias{E}
\alias{SD}
\alias{VAR}
\alias{moments}
\title{Compute the moments of a random variable.}
\usage{
E(x)

VAR(x)

SD(x)
}
\arguments{
  \item{x}{random variable}
}
\description{
Compute the moments of a random variable.
}
\examples{
dice <- rv(1:6)
E(dice)
VAR(dice)
SD(dice)
}

