#' Compute the moments of a random variable.
#'
#' @name moments
#' @param x random variable
#' @examples
#' dice <- rv(1:6)
#' E(dice)
#' VAR(dice)
#' SD(dice)
#' SKEW(dice)
#' SKEW(dice ^ 2)
NULL

#' @rdname moments
#' @export
E <- function(x) sum(as.numeric(x) * probs(x))
#' @rdname moments
#' @export
VAR <- function(x) E((x - E(x)) ^ 2)
#' @rdname moments
#' @export
SD <- function(x) sqrt(VAR(x))
#' @rdname moments
#' @export
SKEW <- function(x) E((x - E(x)) ^ 3) / SD(x) ^ 3
