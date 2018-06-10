context("test-split_nodata_values.R")

testthat::test_that("split_nodata_values works as expected", {
  testthat::expect_equal(split_nodata_values(c("250:255"))[[1]], 250:255)
  testthat::expect_equal(split_nodata_values(c("250,255"))[[1]], c(250,255))
})

testthat::test_that("create_nodata_rcl works as expected", {
  testthat::expect_equal(
    as.data.frame(create_nodata_rcl(c("250,254:255"),
                                               c("255"))[[1]]),
    data.frame(from = c(250,254), to = c(250,255), becomes = c(255,255)))

  testthat::expect_equal(split_nodata_values(c("250,255"))[[1]], c(250,255))
})
