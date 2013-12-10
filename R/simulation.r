#' Simulate n random numbers from the rv
#'
#' @param x a random variable
#' @param n number of simulations
#' @export
#' @examples
#' coin <- rv(c(-1, 1))
#' rsim(coin, 100)
#' mean(rsim(coin, 100))
#' mean(rsim(coin, 1000))
rsim <- function(x, n) {
  sample(x, n, prob = probs(x), replace = TRUE)
}
