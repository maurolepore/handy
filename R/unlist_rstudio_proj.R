#' Get the path to the file that stores RStudio's projects list.
#'
#' @param user One of c("LeporeM", "dora").
#'
#' @return A path.
#' @export
#'
#' @examples
#' get_path_to_listed_rproj()
get_path_to_listed_rproj <- function(user = c("LeporeM", "dora")) {
  user <- user[1]
  paste0(
    "C:/Users/",
    user, 
    "/AppData/Local/RStudio-Desktop/monitored/lists/project_mru"
  )
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
unlist_rstudio_proj <- function(rm_proj, 
                                path = get_path_to_listed_rproj(
                                  user = c("LeporeM", "dora")
                                )) {
  rproj <- readr::read_lines(path)

  keep <- rproj[!grepl(rm_proj, rproj)]
  readr::write_lines(keep, path)
  invisible(keep)
}

