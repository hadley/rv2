#' Compute the moments of a random variable.
#'
#' @name moments
#' @param x random variable to summarise
#' @seealso \code{\link{Z}} to standardise an rv by subtracting off mean
#'   and dividing by standard deviation
#' @examples
#' dice <- rv(1:6)
#' E(dice)
#' VAR(dice)
#' SD(dice)
NULL

#' @rdname moments
#' @export
E <- function(x) {
  if (!is.rv(x)) stop("Input must be an rv object")
  sum(as.numeric(x) * probs(x))
}

#' @rdname moments
#' @export
VAR <- function(x) E((x - E(x)) ^ 2)

#' @rdname moments
#' @export
SD <- function(x) sqrt(VAR(x))

#' Standardise by subtracting off expectation and dividing by sd.
#'
#' This is often called the z score.
#'
#' @param x a random variable
#' @export
#' @examples
#' dice <- rv(1:6)
#' (zdice <- Z(dice))
#' E(zdice)
#' SD(zdice)
Z <- function(x) (x - E(x)) / SD(x)
