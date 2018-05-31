#' From a list of dataframes, get the first element of a variable.
#'
#' Useful to get a srting with which to name a list after `split()`.
#'
#' @param .x A list
#' @param var A variable of `.x` from which to get the first element.
#'
#' @return
#' @export
#'
#' @examples
#' x <- data.frame(x = 1:10, y = letters[2:1])
#' .x <- split(x, x$y)
#' .x
#' map_chr_first(.x, "y")
map_chr_first <- function(.x, var) {
  stopifnot(is.list(.x))
  stopifnot(is.character(var))
  if (!is.data.frame(.x[[1]])) {
    warning("Some elements of `.x` are not dataframes. Is this intentional?")
  }
  .nms <- purrr::map(.x, var)
  unname(
    purrr::map_chr(
      purrr::map(.nms, as.character),
      dplyr::first
    )
  )
}
