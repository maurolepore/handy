# Strings ---

#' Collapse string with commas
#'
#'
#' @param ... Chr
#'
#' @return String
#' @export
#'
#' @examples
#' commas(letters[1:10])
commas <- function(...) {
  stringr::str_c(..., collapse = ", ")
}





#' Convert integer to boolean representation.
#'
#' @param x A vector to which matches and missmatches to represent as TRUE and
#'   FALSE.
#' @param n The length of the bolean representation.
#'
#' @return A boolean representation of length n.
#' @export
#'
#' @examples
#' x <- sample(10) < 4
#' which(x)
#' unwhich(which(x), 10)
unwhich <- function(x, n) {
  out <- rep_len(FALSE, n)
  out[x] <- TRUE
  out
}
