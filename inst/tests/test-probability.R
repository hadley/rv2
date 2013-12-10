context("Probability")

test_that("0 probability of being infinite", {
  X <- rv(1:10)
  expect_equal(P(X > -Inf), 1)
  expect_equal(P(X < -Inf), 0)
  expect_equal(P(X > Inf), 0) 
  expect_equal(P(X < Inf), 1)
})

test_that("missing comparison means 100% of NA", {
  X <- rv(1:5)
  expect_equal(P(X > NA), NA_real_)
  expect_true(is.na(P(X > NA)))
})
