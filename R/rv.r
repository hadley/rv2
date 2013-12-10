#' Make a dscicrete random variable.
#' 
#' @param x a numberic vector giving the values of the random vairalbe.
#' @param probs optional, a numeric vector giving the probabilities 
#'   corresponding to each x value.  If not specific, assumes all outcomes
#'   are equally likely
#' @export
#' @examples
#' dice <- rv(1:6)
#' P(dice > 3)
#' E(dice)
#' P(dice > dice + 1)
rv <- function(x, probs = NULL) {
  if (is.rv(x)) x <- as.numeric(x)
  if (is.null(probs)) {
    probs <- rep(1, length(x)) / length(x)
  }  
  
  ord <- order(x)
  x <- x[ord]
  probs <- probs[ord]
  
  # Simplify by summing probabilities with equal x's
  group <- cumsum(c(TRUE, x[-1] != x[-length(x)]))
  x <- as.vector(tapply(x, group, "[", 1))
  probs <- as.vector(tapply(probs, group, sum))
  
  structure(x, probs = probs, class = "rv")
}

#' Check if an object is a discrete random variable.
#' 
#' @export
#' @param x object to check
#' @examples
#' is.rv(1:10)
#' is.rv(rv(1:10))
is.rv <- function(x) inherits(x, "rv")

probs <- function(x) attr(x, "probs")

#' @export
print.rv <- function(x, ...) {
  X <- format(x, digits = 3)
  P <- format(probs(x), digits = 3)
  out <- cbind(X = X, "P(X)" = P)
  rownames(out) <- rep("", nrow(out))
  print(out, quote = FALSE)
}

#' @export
"[.rv" <- function(x, i, ...) {
  rv(as.numeric(x)[i], prop.table(probs(x)[i]))
}

#' @export
abs.rv <- function(x) {
  rv(NextMethod(), probs(x))
}

#' @export
log.rv <- function(x, base = exp(1)) {
  rv(NextMethod(), probs(x))
}

#' @export
exp.rv <- function(x) {
  rv(NextMethod(), probs(x))
}

#' @export
sqrt.rv <- function(x) {
  rv(NextMethod(), probs(x))
}
