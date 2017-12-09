#' Open file to manually edit RStudio's list of Recent Projects
#' @export
edit_rstudio_recent_projects <- function() {
  path <- "AppData/Local/RStudio-Desktop/monitored/lists/project_mru"
  base_path <- sub("Documents", "", path.expand("~"))
  full_path <- paste0(base_path, path)
  rstudioapi::navigateToFile(full_path)
}

#' Open files and directories of a project and package.
#' @name open
#' @param dir Directory
NULL

#' @rdname open
#' @export
open_snippets <- function() {
  shell.exec(path.expand("~/.R/snippets"))
}

#' @rdname open
#' @export
open_dir <- function(dir = NULL) {
  shell.exec(paste0(usethis::proj_get(), "/", dir))
}

open_factory <- function(dir) {
  function(){
    open_dir(dir)
  }
}

#' @rdname open
#' @export
open_proj <- open_factory(NULL)

#' @rdname open
#' @export
open_inst <- open_factory("inst")

#' @rdname open
#' @export
open_data <- open_factory("data")

#' @rdname open
#' @export
open_data_raw <- open_factory("data-raw")

#' @rdname open
#' @export
open_docs <- open_factory("docs")

#' @rdname open
#' @export
open_man <- open_factory("man")

#' @rdname open
#' @export
open_r <- open_factory("R")

#' @rdname open
#' @export
open_tests <- open_factory("tests")

#' @rdname open
#' @export
open_testthat <- open_factory("tests/testthat")
