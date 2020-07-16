context("Test minimal example with TMB functionality")

test_that("Minimal works", {
  j <- run_minimal()
  colnames(j) <- NULL
  expect_equal(format(j[1,], nsmall = 20, scientific = FALSE),
               c("591.18438065498935429787",
                 " 41.44367200580492038853"))
  expect_equal(format(j[2,], nsmall = 20, scientific = FALSE),
               c("6.19871514937633349973",
                 "0.05954910485157628719"))
})