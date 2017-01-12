context("Expectation")

dice <- rv(1:6)
coin <- rv(c(-1, 1))

test_that("expectation correct for known cases", {
  expect_equal(E(dice), 3.5)
  expect_equal(E(coin), 0)
})

test_that("expectation is additive", {
  expect_equal(E(dice + coin), E(dice) + E(coin))

  expect_equal(E(dice + dice), 2 * E(dice))
  expect_equal(E(dice + dice + dice), 3 * E(dice))
})

test_that("expectation is multiplicatve", {
  expect_equal(E( 6 * dice),  6 * E(dice))
  expect_equal(E( 1 * dice),  1 * E(dice))
  expect_equal(E(-1 * dice), -1 * E(dice))
  expect_equal(E( 0 * dice),  0 * E(dice))
})

test_that("expectation throws error if input not an rv", {
  expect_error(E(5), "must be an rv object")
  expect_error(E("a"), "must be an rv object")
})
