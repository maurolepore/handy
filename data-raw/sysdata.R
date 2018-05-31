# This file generates internal data: sysdata.rda. Only one sysdata.rda can exist
# in data/. Yet, many data objects can be saved into a single sysdata.rda. This
# file creates all internal data objects

library(readr)



# Template for package website: _pkgdown.yml  -----------------------------

pkgdown_template <- readr::read_lines("./data-raw/pkgdown_template.yml")



# Use objects as internal data --------------------------------------------

usethis::use_data(
  pkgdown_template, 
  internal = TRUE, overwrite = TRUE
)
