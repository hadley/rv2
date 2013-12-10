# Would be better to implement this using the Ops group generic, but that
# assumes a rather high level of S3 knowledge

#' @export
"+.rv" <- function(e1, e2) combine(e1, e2, `+`)
#' @export
"-.rv" <- function(e1, e2) combine(e1, e2, `-`)
#' @export
"*.rv" <- function(e1, e2) combine(e1, e2, `*`)
#' @export
"%%.rv" <- function(e1, e2) combine(e1, e2, `%%`)
#' @export
"%/%.rv" <- function(e1, e2) combine(e1, e2, `%/%`)
#' @export
"/.rv" <- function(e1, e2) combine(e1, e2, `/`)
#' @export
"^.rv" <- function(e1, e2) combine(e1, e2, `^`)
#' @export
"<.rv" <- function(e1, e2) combine(e1, e2, `<`)
#' @export
"<=.rv" <- function(e1, e2) combine(e1, e2, `<=`)
#' @export
">.rv" <- function(e1, e2) combine(e1, e2, `>`)
#' @export
">=.rv" <- function(e1, e2) combine(e1, e2, `>=`)
#' @export
"==.rv" <- function(e1, e2) combine(e1, e2, `==`)
#' @export
"!=.rv" <- function(e1, e2) combine(e1, e2, `!=`)
#' @export
"&.rv" <- function(e1, e2) combine(e1, e2, `&`)
#' @export
"|.rv" <- function(e1, e2) combine(e1, e2, `|`)


# Combine two independent random variables, or a random variable and a numeric
# with a vectorised function 
combine <- function(e1, e2, f) {
  if (is.rv(e1) && is.rv(e2)) {
    # Use outer to generate all pairwise combinations
    vals <- as.vector(outer(e1, e2, f))
    probs <- as.vector(outer(probs(e1), probs(e2), "*"))
    return(rv(vals, probs))
  }
  
  # Figure out which one is the rv, and which one is the number
  if (is.rv(e1)) {
    rv <- e1
    n <- e2
  } else {
    rv <- e2
    n <- e1
  }
  
  rv(f(as.numeric(rv), n), probs(rv))
}


#' Random if.
#' 
#' @param x an event (a random variable with logical values)
#' @param yes number to return if event occurs
#' @param no number to return if event doesn't occur
#' @export
#' @examples
#' dice <- rv(1:6)
#' rif(dice > 3, -1, 5)
rif <- function(x, yes, no) {
  stopifnot(is.rv(x))
  stopifnot(is.numeric(yes), length(yes) == 1)
  stopifnot(is.numeric(no), length(no) == 1)

  rv(c(no, yes), probs(x))
}