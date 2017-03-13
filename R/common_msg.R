#' Print messages that commonly open documents.
#'
#' @return Messages
#' @export
#'
#' @examples
#' msg_open()
msg_open <- function() {
  message("
    [Design zen](https://github.com/forestgeo/learn/issues/8)

    Contact [Mauro Lepore](maurolepore@gmail.com)(maintainer)

    [Code Philosophy](https://gist.github.com/maurolepore/d21564d746f3c3b608c781fb3baf72b7)

    [Code glossary](https://gist.github.com/maurolepore/f7489d127f4749d76150f373dbbc4843)
    ")
  }



#' Print GUEST_TOKEN to pass to auto_token argument of devtools::install_Github
#'
#' @return
#' @export
#'
#' @examples
msg_guest_token <- function(){
  message('GUEST_TOKEN <- "d60277dad4177c278455e885366a7170e22ae092"')
  }

