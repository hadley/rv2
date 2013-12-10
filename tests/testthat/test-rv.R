context("rv")


test_that("probabilities sum to 1 after subsetting", {
  dice <- rv(1:6)
  
  expect_equal(sum(probs(dice[1])), 1)
  expect_equal(sum(probs(dice[1:3])), 1)
  expect_equal(sum(probs(dice[1:5])), 1)
})