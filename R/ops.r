# Combine two independent random variables (including the special case
# of a random variable and a number). We basically generate the complete 
# two way table, and then collapse down to a random variable
combine <- function(e1, e2, fun) {
  e1 <- as.rv(e1)
  e2 <- as.rv(e2)
  
  # Use outer to generate all pairwise combinations, combining using fun
  vals <- outer(e1, e2, fun)
  # Probabilities get multipled together
  probs <- outer(probs(e1), probs(e2), "*")
  
  # Rely on rv to collapse any duplicates
  rv(as.vector(vals), as.vector(probs))
}

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