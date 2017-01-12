context("rv")

test_that("probabilities must be positive and add to 1", {
  expect_error(rv(1, 0.9), "sum to 1")
  expect_error(rv(1, -0.1), "positive")
})

test_that("duplicate values have probabilities collapsed", {
  expect_equal(rv(c(1, 1)), rv(1))
  expect_equal(rv(c(1, 1, 2), c(0.25, 0.25, 0.5)), rv(1:2))
})

test_that("probabilities sum to 1 after subsetting", {
  dice <- rv(1:6)
  
  expect_equal(sum(probs(dice[1])), 1)
  expect_equal(sum(probs(dice[1:3])), 1)
  expect_equal(sum(probs(dice[1:5])), 1)
})