#' Download ctfs functions from my dropbox-public, filter and load useful ones
#'
#' @param funs Character string of functions required. All functions if NULL.
#'
#' @return
#' @export
#'
#' @examples
#'
#' # install.packages("tibble")
#' library(tibble)
#' ctfs_filter(c("abundance", "map"))
ctfs_filter <- function(funs = NULL) {
  # funs must be either NULL or a characther string
  stopifnot(is.null(funs) || is.character(funs))

  # 1. Download ctfs_filterable.rds to working directory (92.2 KB)
  url <- "https://www.dropbox.com/s/lfjbugyztjz0jhk/ctfs_filterable.rds?dl=0"
  utils::download.file(url, destfile = "ctfs_filterable.rds")

  # 2. Load
  ctfs <- readRDS("ctfs_filterable.rds")
  ctfs <- readr::read_rds("ctfs_filterable.rds")
  ctfs <- readr::read_rds("C:/Users/dora/Dropbox/Public/ctfs_filterable.rds")

  saveRDS(ctfs_filterable.rds, "C:/Users/dora/Dropbox/Public/ctfs_filterable.rds")

  # Filter to choose the functions required
  if (is.null(funs)) {funs <- unique(ctfs$fname)}

  filtered <- ctfs[ctfs$fname %in% funs, ]

  # convert to named list
  filtered <- setNames(filtered[[2]], filtered[[1]])
  # load into the global environment
  invisible(list2env(filtered, envir = .GlobalEnv))
  }


