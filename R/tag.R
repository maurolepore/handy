tag <- function(n = 3) {
  paste0(
    purrr::rerun(2, sample(letters, 1)),
    purrr::rerun(2, sample(0:9, 1)),
    collapse = ""
  )
}











