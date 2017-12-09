#' Search functions in a package matching a pattern.
#'
#' You may need a function which name you remember only partly. Use this
#' function to serach all functions which name match whatever you remember.
#'
#' There are multiple ways to find a function in a package, e.g. with the
#' autocomplete feature in RStudio; by searching the package's index; and by
#' searching the function's reference in the package's website. However, there
#' is no way to do it programmatically. This function provides a _programmatic_
#' way to search functions in a package, based on a user-defined pattern, and
#' makes it easy to search multiple patterns at once via `lapply()`.
#'
#' @param pattern Argument passed to [base::grepl()].
#' @param pkg_nm A character string giving the name of the package to search.
#'
#' @seealso [base::grepl()]
#'
#' @return A vector of characters
#' @export
#'
#' @examples
#' # R loads a number of packages automatically. See what those packages are:
#' search()
#'
#' # Directly search functions in any package already loaded: e.g. "base"
#' search_function("summary", pkg_nm = "base")
#'
#' # Case is ignored
#' search_function("Summary", pkg_nm = "base")
#'
#' # Easily search multiple patterns with lapply
#' multiple_patterns <- c("min", "ply")
#' lapply(multiple_patterns, search_function, pkg_nm = "base")
#'
#' # If the package you want to search isn't load it, you must load it first.
#' \dontrun{
#' library(ggplot2)
#' search_function("point", pkg_nm = "ggplot2")
#' }
#'
search_function <- function(pattern, pkg_nm) {
fun_in_pkg <- ls(paste0("package:", pkg_nm))
fun_in_pkg[grepl(pattern, fun_in_pkg, ignore.case = TRUE)]
}





