# devtools::install_github("DataKnowledge/DependenciesGraphs")
library(DependenciesGraphs)
library(ctfs)

#' Explore dependencies between functions in a package.
#'
#' @param pkg Character string giving the name of a package.
#' @param .f  Character string giving the name of a function.
#'
#' @return A plot
#' @seealso [DependenciesGraphs::funDependencies()].
#' @export
#'
#' @examples
#' library(ctfs)
#' explore_dependencies("ctfs", "abundanceperquad")
explore_dependencies <- function(pkg, .f) {
  if (!isNamespaceLoaded(pkg)) {
    stop(paste0("run library(", pkg, ") and retry."))
  }
  in_package <- paste0("package:", pkg)
  dep <- DependenciesGraphs::funDependencies(in_package, .f)
  plot(dep)
}
