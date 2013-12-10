#' Standardise by subtracting off expectation and dividing by sd.
#' 
#' This is often called the z score.
#' @param x a random variable
#' @export
#' @examples
#' dice <- rv(1:6)
#' (zdice <- Z(dice))
#' E(zdice)
#' SD(zdice)
Z <- function(x) (x - E(x)) / SD(x)

