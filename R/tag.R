#' Tag a line in a file with and optional message.
#'
#' Tags help track information because they can be searched in RStudio with the
#' shortcut `Ctrl+.` ("Go To File/Function...").
#'
#' @param msg An optional message (default is an empty message).
#'
#' @return A closure (see [Closures](https://goo.gl/mHvapg) in [Advanced
#'   R](http://adv-r.had.co.nz/) by Hadley Whickham).
#' @export
#'
#' @examples
#'
#' # Tag a line in a file, so you can come back to that line later easily.
#' fig_key <- tag("Figure showhing key results.")
#' # <cool code>
#' # To locate the tag again, search it in RStudio with the shortcut Ctrl+.
#'
#' # You may tag the next item in your "to do" list.
#' todo <- tag("Dear future me, continue working here.")
#' todo()
#'
#' # Giving a message is optional.
#' todo <- tag()
#' todo()
#'
#' # You may track tags in you manuscript, to link text and code.
tag <- function(msg = "") {
  function() {
    message(msg)
    invisible(msg)
  }
}
