#' Add a string to the beginning of all lines in a file.
#'
#' @param file A path to a file.
#' @param start_with A string to start all lines with. When creating a function
#'   from a long script, you may want to programmatically add two spaces to all
#'   lines. So start_with "  ".
#' @param save_as If missing, the value  will be printed to the console.
#'
#' @return
#' @export
#
#
# example:
# file <- "./data-raw/data.R"
# start_with <- "  "
# save_as <- "./R/data.R"
# start_lines_with("./data-raw/data.R", "  ", "./R/data.R")
#
#
start_lines_with <- function(file, start_with, save_as) {
  lines <- readr::read_lines(file)
  added <- stringr::str_replace(lines, "^(.*)$", paste0(start_with, "\\1"))
  if (missing(save_as)) {
    return(added)
  } else {
    readr::write_lines(added, save_as)
  }
}
