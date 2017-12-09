#' Write a file with all dependencies of a user-defined function.
#'
#' @param pkg String giving the package where `fun` lives, with the format
#'     "package:PACKAGE", where lowercase is literal and caps is variable.
#' @param fun String giving the function which dependencies you want to write
#'     to a file.
#' @param file_nm String giving the path to a file where to write the output.
#'
#' @return A file with the functions on which `fun` depends.
#' @export
#'
#' @examples
#' \dontrun{
#' library(base)
#' pkg <- "package:base"
#' fun <- "sum"
#' file_nm <- "./dependencies_of_base-sum.R"
#' write_fun_dependencies(pkg, fun, file_nm)
#' }
write_fun_dependencies <- function(pkg, fun, file_nm) {
  dep <- DependenciesGraphs::funDependencies(pkg, fun)
  nms <- as.character(dep[["Nomfun"]][["label"]])
  
  named_functions_list <- purrr::set_names(purrr::map(nms, get), nms)
  deparsed_funs <- purrr::map(named_functions_list, deparse)
  declarations <- paste(nms, "<- ")
  
  header_raw <- c(
    "#\' Internal.\n",
    "#\'\n",
    "#\' @family functions from http://ctfs.si.edu/Public/CTFSRPackage/\n",
    "#\' @keywords internal"
  )
  header <- paste0(header_raw, collapse = "")
  
  concatenated <- list(
    header,
    declarations, 
    deparsed_funs, 
    "\n\n"
  )
  
  purrr::pmap(concatenated, c) %>% 
    purrr::reduce(c) %>% 
    readr::write_lines(file_nm)
}
