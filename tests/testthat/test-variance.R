context("Variance")

test_that("Variance correct for bernoulli rvs", {
  # http://en.wikipedia.org/wiki/Bernoulli_distribution
  var_bernoulli <- function(p) p * (1 - p)
  bernoulli <- function(p) rv(c(0, 1), c(p, 1 - p))
  
  expect_equal(VAR(bernoulli(0.5)), var_bernoulli(0.5))
  expect_equal(VAR(bernoulli(0.1)), var_bernoulli(0.1))
  expect_equal(VAR(bernoulli(0.001)), var_bernoulli(0.001))
  expect_equal(VAR(bernoulli(0)), var_bernoulli(0))
})

test_that("Variance correct for discrete uniform rvs", {
  # http://en.wikipedia.org/wiki/Uniform_distribution_(discrete)
  var_dunif <- function(a, b) {
    n <- b - a + 1
    (n ^ 2 - 1) / 12
  }
  dunif <- function(a, b) rv(a:b)
  
  expect_equal(VAR(dunif(0, 10)), var_dunif(0, 10))
  expect_equal(VAR(dunif(0, 100)), var_dunif(0, 100))
  expect_equal(VAR(dunif(-10, 10)), var_dunif(-10, 10))
})

test_that("Var(a * x) = a^2 * Var(x)", {
  dice <- rv(1:6)
  
  expect_equal(VAR(0 * dice), 0 * VAR(dice))
  expect_equal(VAR(dice), VAR(-1 * dice))
})
