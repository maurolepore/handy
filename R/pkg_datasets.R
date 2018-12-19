#' @export
pkg_datasets_df <- function(packages) {
  packages %>%
    purrr::map(pkg_datasets_chr) %>%
    purrr::set_names(packages) %>%
    tibble::enframe(name = "package", value = "datasets") %>%
    tidyr::unnest()
}

#' @export
pkg_datasets_chr <- function(x) {
  if (!is_attached(x)) {
    stop(x, " must be attached (use `library()`).", call. = FALSE)
  }
  utils::data(package = x)$results[, "Item"]
}

is_attached <- function(pkg) {
  any(grepl(paste0("package:", pkg), search()))
}

#' @export
pkg_get <- function(x, pkg) {
  get(x, asNamespace(pkg))
}
