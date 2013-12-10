\name{moments}
\alias{E}
\alias{SD}
\alias{SKEW}
\alias{VAR}
\alias{moments}
\title{Compute the moments of a random variable.}
\usage{
  E(x)

  VAR(x)

  SD(x)

  SKEW(x)
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
SKEW(dice)
SKEW(dice ^ 2)
}

