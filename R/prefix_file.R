#' Add a prefix to a file name.
#'
#' @param from Path where the files live.
#' @param to Optional. Path where the files will be copied to. If NULL (default)
#'   files will be renamed in the directory `from`.
#' @param prefix A string. Prefix to add to the file names.
#'
#' @return The files with a prefix added to their names.
#' @export
#'
#' @examples
#'
#' prefix_file(from = "./file-from/", prefix = "my_prefix")
#' prefix_file(
#'   from = "./file-from/",
#'   to = "./file-to",
#'   prefix = "my_prefix"
#' )
prefix_file <- function(from, to = NULL, prefix) {
  if (missing(to)) {to <- from}
  files_names <- dir(from)
  tab_from_to <- tibble::tibble(
    path_full_from = paste0(from, files_names),
    path_full_to = paste0(
      to, prefix, files_names
    )
  )
  purrr::walk2(
    tab_from_to$path_full_from,
    tab_from_to$path_full_to,
    file.rename
  )
}




