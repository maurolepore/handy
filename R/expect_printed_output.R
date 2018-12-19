expect_printed_output <- function(object, update = FALSE) {
  file <- rlang::quo_text(rlang::enquo(object))
  
  testthat::expect_known_output(
    object, paste0("ref-", file),
    print = TRUE, update = update
  )
  
  invisible(object)
}
