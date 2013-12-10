\name{P}
\alias{P}
\title{Compute the probability that an event occurs.}
\usage{
P(x)
}
\arguments{
  \item{x}{an event. An event is a special type of discrete
  random variable that only has two outcomes: \code{TRUE}
  or \code{FALSE}.  It is usually created by applying a
  comparison operator to a random variable.}
}
\value{
a probability between 0 and 1.
}
\description{
Compute the probability that an event occurs.
}
\examples{
wheel <- rv(1:20)
P(wheel > 10)
P(wheel \%\% 2 == 0)
}

