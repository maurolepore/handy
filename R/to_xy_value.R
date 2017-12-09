#' Gather columns and rows of a matrix to variables x and y of a tibble.
#'
#' Gather columns and rows of a matrix to variables `x` and `y` of a tibble,
#' with values passed to variable `value`.
#'
#' @param mat A matrix.
#' @param grid A named vector of length 2, with first element named x and second element named y.
#'
#' @return A tibble with variables `x`, `y`, `value`.
#' @export
#'
#' @examples

#' \dontrun{
#' # Show that bci_elevation and bci_matrix contain the same information. They
#' # justdiffer in the class.
#' # library(tidyverse)
#' # library(bciex)
#' # 
#' # # Class is different
#' # class(bci_mat)
#' # class(bci_elevation)
#' # 
#' # # But contents are the same.
#' # # Tidy mat: each variable in a column; each observation in a row
#' # mat <- to_xy_value(bci_mat, grid = c(y = 5, x = 5))
#' # mat <- rename(mat, elev = value)
#' # # Arrange in the same way
#' # mat <- mat %>% arrange(x, y, elev)
#' # elev <- bci_elevation %>% arrange(x, y, elev)
#' # identical(mat, elev)
#' }
to_xy_value <- function(mat, grid) {
   mat_df <- as.data.frame.matrix(mat)

   grid_x_id <- seq_along(names(mat_df))
   grid_y_id <- as.numeric(rownames(mat_df))

   grid_x_size <- grid["x"]
   grid_y_size <- grid["y"]

   x_corrected_id <- grid_x_id * grid_x_size - grid_x_size
   y_corrected_id <- grid_y_id * grid_y_size - grid_y_size

   mat_df <- purrr::set_names(mat_df, x_corrected_id)
   mat_df$y <- y_corrected_id
   mat_df <- tidyr::gather(mat_df, x, value, -y)
   mat_df <- dplyr::select(mat_df, .data$x, .data$y, .data$value)
   mat_df <- dplyr::mutate_at(mat_df, c("x", "y"), as.integer)
   mat_df <- dplyr::arrange(mat_df, .data$x, .data$y, .data$value)
   tibble::as_tibble(mat_df)
}





