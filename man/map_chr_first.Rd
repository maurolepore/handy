% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{map_chr_first}
\alias{map_chr_first}
\title{From a list of dataframes, get the first element of a variable.}
\usage{
map_chr_first(.x, var)
}
\arguments{
\item{.x}{A list}

\item{var}{A variable of \code{.x} from which to get the first element.}
}
\description{
Useful to get a srting with which to name a list after \code{split()}.
}
\examples{
x <- data.frame(x = 1:10, y = letters[2:1])
.x <- split(x, x$y)
.x
map_chr_first(.x, "y")
}
