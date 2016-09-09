#' Make a discrete random variable.
#'
#' @param x a numeric vector giving the values of the random variable.
#' @param probs optional, a numeric vector giving the probabilities
#'   corresponding to each x value. If not specific, assumes all outcomes
#'   are equally likely
#' @export
#' @return An S3 object of class rv.
#' @examples
#' dice <- rv(1:6)
#' P(dice > 3)
#' E(dice)
#' P(dice > dice + 1)
#'
#' coin <- rv(c("H", "T"))
#' # Event that you flip a head:
#' coin == "H"
#' # Game where you win $1 if you get a head, lose $1 if you get a tail
#' rif(coin == "H", 1, -1)
rv <- function(x, probs = NULL) {
  if (is.rv(x)) x <- as.numeric(x)
  if (is.null(probs)) {
    probs <- rep(1, length(x)) / length(x)
  } else {
    if (any(probs < 0)) stop("Probabilities must be positive")
    if (abs(sum(probs) - 1) > 1e-6) stop("Probabilities must sum to 1")
  }

  # Simplify by summing probabilities with equal x's. Need to use
  # addNA since otherwise tapply silently drops groups with missing values
  grp <- addNA(x, ifany = TRUE)
  x_new <- as.vector(tapply(x, grp, "[", 1))
  probs <- as.vector(tapply(probs, grp, sum))

  # Set probs and class attributes
  structure(x_new, probs = probs, class = "rv")
}

#' Check if an object is a discrete random variable.
#'
#' @export
#' @param x object to check
#' @examples
#' is.rv(1:10)
#' is.rv(rv(1:10))
is.rv <- function(x) inherits(x, "rv")

#' Coerce an object to an rv.
#'
#' Currently has methods for rv objects (which leaves unchanged), and
#' for integer, numeric and logical vectors (which assume are uniformly
#' distributed).
#'
#' @export
#' @param x An object to coerce
#' @examples
#' as.rv(1:10)
#' as.rv(rv(c(1, 1, 2, 3)))
as.rv <- function(x) UseMethod("as.rv")

#' @export
as.rv.rv <- function(x) x

#' @export
as.rv.numeric <- function(x) rv(x)
#' @export
as.rv.integer <- function(x) rv(x)
#' @export
as.rv.logical <- function(x) rv(x)
#' @export
as.rv.character <- function(x) rv(x)


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

#' @export
plot.rv <- function(x, ...) {
  name <- deparse(substitute(x))
  ylim <- range(0, probs(x))

  graphics::plot(as.numeric(x), probs(x), type = "h", ylim = ylim,
    xlab = name, ylab = paste0("P(", name, ")"), ...)
  graphics::points(as.numeric(x), probs(x), pch = 20)
  graphics::abline(h = 0, col = "gray")
}
