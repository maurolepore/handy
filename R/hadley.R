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

