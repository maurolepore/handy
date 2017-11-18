#' Get the path to the file that stores RStudio's projects list.
#'
#' @return A path.
#' @export
#'
#' @examples
#' get_path_to_listed_rproj()
get_path_to_listed_rproj <- function() {
  "C:/Users/dora/AppData/Local/RStudio-Desktop/monitored/lists/project_mru"
}


#' Remove specific projects from RStudio's list under File > Recent Projects.
#'
#' This function is called for its side effect: to remove one or more RStudio's
#' projects from the list of recent projects found in File > Recent Projects.
#'
#' @param rm_proj Pattern to match the project(s) to remove.
#' @param path Path to the file where RStudio stores the list of Recent
#'   Projects.
#'
#' @return Invisibly returns the to Keep. The side effect is a list of Recent
#'   RStudio projects thas lacks the ones the user chosed to remove.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Remove "project1" and "project3".
#' x <- unlist_rstudio_proj("project1|project3")
#' # Show the projects to keep in File > Recent Projects
#' x
#' }
unlist_rstudio_proj <- function(rm_proj, path = get_path_to_listed_rproj()) {
  rproj <- readr::read_lines(path)

  keep <- rproj[!grepl(rm_proj, rproj)]
  readr::write_lines(keep, path)
  invisible(keep)
}

#' Open file to manually edit RStudio's list of Recent Projects
#' @export
edit_rstudio_recent_projects <- function() {
  path <- "AppData/Local/RStudio-Desktop/monitored/lists/project_mru"
  base_path <- sub("Documents", "", path.expand("~"))
  full_path <- paste0(base_path, path)
  rstudioapi::navigateToFile(full_path)
}

#' Open directory with snippets files.
#' @export
open_snippets <- function() {
  shell.exec(path.expand("~/.R/snippets"))
}
