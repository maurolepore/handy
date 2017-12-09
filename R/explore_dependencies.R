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
#' library(base)
#' explore_dependencies("base", "sum")
explore_dependencies <- function(pkg, .f) {
  if (require("DependenciesGraphs")) {
    if (!isNamespaceLoaded(pkg)) {
      stop(paste0("run library(", pkg, ") and retry."))
    }
  }
  in_package <- paste0("package:", pkg)
  dep <- DependenciesGraphs::funDependencies(in_package, .f)
  plot(dep)
}
