#' Compute the probability that an event occurs.
#' 
#' @param x an event. An event is a special type of discrete random variable
#'   that only has two outcomes: \code{TRUE} or \code{FALSE}. It is usually
#'   created by applying a comparison operator to a random variable.
#' @return a probability (numeric vector of length 1) between 0 and 1.
#' @export
#' @examples
#' wheel <- rv(1:20)
#' P(wheel > 10)
#' P(wheel %% 2 == 0)
P <- function(x) {
  stopifnot(is.logical(x), is.rv(x))
  sum(probs(x)[x])
}
