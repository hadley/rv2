context("Expectation")

dice <- rv(1:6)
coin <- rv(c(-1, 1))

test_that("expectation is additive", {
  expect_that(E(dice + coin), equals(E(dice) + E(coin)))

  expect_that(E(dice + dice), equals(2 * E(dice)))
  expect_that(E(dice + dice + dice), equals(3 * E(dice)))
})


test_that("expectation is multiplicatve", {
  expect_that(E(6 * dice), equals(6 * E(dice)))
  expect_that(E(1 * dice), equals(1 * E(dice)))
  expect_that(E(-1 * dice), equals(-1 * E(dice)))
  expect_that(E(0 * dice), equals(0 * E(dice)))
})