context("test-search_function.R")

test_that("type retrun is character", {
  library("base")
  actual <- search_function("sum", pkg_nm = "base")
  expect_type(actual, "character")


})

test_that("case is ignored", {
  library("base")
  mixedcase <- search_function("Summary", pkg_nm = "base")
  lowercase <- search_function("summary", pkg_nm = "base")
  uppercase <- search_function("SUMMARY", pkg_nm = "base")

  expect_equal(uppercase, lowercase)
  expect_equal(mixedcase, lowercase)
})

