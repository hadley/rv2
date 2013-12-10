#' @export
plot.rv <- function(x, ...) {
  name <- deparse(substitute(x))
  ylim <- range(0, probs(x))
  
  plot(as.numeric(x), probs(x), type = "h", ylim = ylim,
    xlab = name, ylab = paste0("P(", name, ")"))
  points(as.numeric(x), probs(x), pch = 20)
  abline(h = 0, col = "gray")  
}
