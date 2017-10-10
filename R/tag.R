collapse_rerun <- function(x, n) {
  paste(unlist(purrr::rerun(n, sample(x, 1))), collapse = "")
}

#' Produce a tag label of letters and numbers.
#'
#' @param n Number of letters/numbers you want the tag to have.
#'
#' @return A string.
#' @export
#'
#' @examples
#' tag()
#' tag(3)
tag <- function(n = 2) {
  paste0(collapse_rerun(letters, n), collapse_rerun(0:9, n), collapse = "")
}











