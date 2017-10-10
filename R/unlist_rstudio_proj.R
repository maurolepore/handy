#' Get the path to the file that stores RStudio's projects list.
#'
#' @return A path.
#' @export
#'
#' @examples
#' get_my_rstudio_proj_list()
get_my_rstudio_proj_list <- function() {
  "C:/Users/dora/AppData/Local/RStudio-Desktop/monitored/lists/project_mru"
}


#' Remove projects from RStudio's project list.
#'
#' @param path_to_list Path to the file where the projects are listed. In my
#'   computer, they are given by [get_my_rstudio_proj_list()].
#' @param rm_proj
#'
#' @return Invisible projects to keep. This function is called for its side
#'   effect: to overwite the list of RStudio projects to exclude the ones the
#'   user choosed to exclude.
#' @export
#'
#' @examples
#' \dontrun{
#' x <- unlist_rstudio_proj(get_my_rstudio_proj_list(), rm_proj = "todo|handy")
#' x
#' }
unlist_rstudio_proj <- function(rm_proj, path_to_list = get_my_rstudio_proj_list()) {
  projs <- readr::read_lines(path_to_list)

  keep <- projs[!grepl(rm_proj, projs)]
  readr::write_lines(keep, path_to_list)
  invisible(keep)
}

