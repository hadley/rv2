\name{Z}
\alias{Z}
\title{Standardise by subtracting off expectation and dividing by sd.}
\usage{
Z(x)
}
\arguments{
  \item{x}{a random variable}
}
\description{
This is often called the z score.
}
\examples{
dice <- rv(1:6)
(zdice <- Z(dice))
E(zdice)
SD(zdice)
}

