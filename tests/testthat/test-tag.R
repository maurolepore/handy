context("tag")

test_that("tag returns a custom message, or an empty message by default", {
  default_message <- tag()
  custom <- "This is a custom message"
  custom_message <- tag(custom)
  expect_message(default_message(), "")
  expect_message(custom_message(), custom)
})
