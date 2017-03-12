# Given package names in a character string, install missing ones and load all

is_required <- function(pkg) {
  !requireNamespace(pkg)
  }

install_each_if <- function(pkg) {
  if (is_required(pkg)) utils::install.packages(pkg)
  }

install_missing <- function(pkg) {lapply(pkg, install_each_if)}

load_all <- function(pkg) {lapply(pkg, library, character.only = TRUE)}

#' Given package names, install missing ones and load all
#'
#' @param pkg Package names in a character string.
#'
#' @return nothing but messages from install.packages() and library()
#' @export
#'
#' @examples
#' \dontrun{
#'   pkg <- c("dplyr", "pacman")
#'   install_missing_load_all(pkg)
#'   }
install_missing_load_all <- function(pkg) {
  install_missing(pkg)
  loaded <- load_all(pkg)
  }


