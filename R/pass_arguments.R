

#' Reformat arguments for funcitons, from arg1, arg2 to arg1 = arg1, arg2 = arg2
#' 
#' This is useful when you extract a funciton and the arguments in the signature 
#' need to be converted to arguments in a call to the function.
#'
#' @param string A string. e.g. c("arg1, arg2")
#'
#' @return A string. eg. arg1 = arg1, arg2 = arg2
#' @export
#'
#' @examples
#' pass_arguments(c("one, two"))
pass_arguments <- function(string) {
  x <- stringr::str_split(string, ",")[[1]] %>% 
    tibble::tibble()
  dplyr::bind_cols(x, x) %>% 
    setNames(c("left", "right")) %>% 
    dplyr::transmute(args = paste0(left, " =", right)) %>% 
    dplyr::pull(args) %>% 
    paste0(collapse = ",") %>% 
    cat()
}

