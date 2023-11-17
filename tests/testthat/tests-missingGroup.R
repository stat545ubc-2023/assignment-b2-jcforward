library(testthat)
library(missingGroup)

# Test 1: Correctly counts missing values in each group
test_that("Correctly counts missing values in each group", {
  data <- data.frame(group = c("A", "A", "B", "B"),
                     val1 = c(NA, 2, 3, NA),
                     val2 = c(1, NA, NA, 4))
  result <- count_all_missing_by_group(data, group)

  expected <- tibble::as_tibble(data.frame(group = c("A", "B"),
                                           val1 = c(1, 1),
                                           val2 = c(1, 1)))
  expect_equal(result, expected)
})

# Test 2: Handles no missing values correctly
test_that("Handles no missing values correctly", {
  data <- data.frame(group = c("A", "B"), val = c(1, 2))
  result <- count_all_missing_by_group(data, group)

  expected <- tibble::as_tibble(data.frame(group = c("A", "B"), val = c(0, 0)))
  expect_equal(result, expected)
})

# Test 3: Errors on non-existent group column
test_that("Errors on non-existent group column", {
  data <- data.frame(val = c(1, 2, NA))
  expect_error(count_all_missing_by_group(data, non_existent_group))
})

