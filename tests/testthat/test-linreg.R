context("Test linreg with TMB functionality")

test_that("Linreg works", {
  j <- run_linreg()
  expect_equal(format(j[1,], nsmall = 20, scientific = FALSE),
               c("13.12724494489211046755",
                 "72.19984719690660313063",
                 "-0.00000019803342223771"))

  j <- run_linreg(101)
  expect_equal(format(j[1,], nsmall = 20, scientific = FALSE),
               c(" 35.01395243288285286098",
                 "192.57673838085563033928",
                 "  0.00000054077407596467"))

})