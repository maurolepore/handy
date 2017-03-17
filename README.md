
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Travis-CI Build Status](https://travis-ci.org/maurolepore/handy.svg?branch=master)](https://travis-ci.org/maurolepore/handy)[![Coverage Status](https://img.shields.io/codecov/c/github/maurolepore/handy/master.svg)](https://codecov.io/github/maurolepore/handy?branch=master)[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.399053.svg)](https://doi.org/10.5281/zenodo.399053)

handy
=====

Handy tools

Installation
------------

``` r
# install.packages("devtools")
install_github("maurolepore/handy")
library(handy)
```

Example
-------

``` r
pkg <- c("dplyr", "pacman")
install_missing_load_all(pkg)
```
