#' Add ./git.R with common git commands.
#'
#' @export
use_git_commands <- function() {
  if(file.exists("./git.R")) {
    stop("A git.R file already exists in your working directory.")
  }
  message("Saving ./git.R")
  readr::write_file(git_commands, "./git.R")
  usethis::use_build_ignore("git.R")
}




