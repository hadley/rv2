#' Standardise by subtracting off expectation and dividing by sd.
#' 
#' This is often called the z score.
#' @param x a random variable
#' @export
Z <- function(x) (x - E(x)) / SD(x)

