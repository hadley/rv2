\name{rv}
\alias{rv}
\title{Make a discrete random variable.}
\usage{
rv(x, probs = NULL)
}
\arguments{
  \item{x}{a numeric vector giving the values of the random
  vairable.}

  \item{probs}{optional, a numeric vector giving the
  probabilities corresponding to each x value. If not
  specific, assumes all outcomes are equally likely}
}
\value{
An S3 object of class rv.
}
\description{
Make a discrete random variable.
}
\examples{
dice <- rv(1:6)
P(dice > 3)
E(dice)
P(dice > dice + 1)
}

