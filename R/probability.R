#' @export
P <- function(x) {
  stopifnot(is.logical(x), is.rv(x))
  sum(probs(x)[x])
}
