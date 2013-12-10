context("Variance")

dice <- rv(1:6)

test_that("Var(a * x) = a^2 * Var(x)", {
  expect_equal(VAR(0 * dice), 0 * VAR(dice))
  expect_equal(VAR(dice), VAR(-1 * dice))
})
