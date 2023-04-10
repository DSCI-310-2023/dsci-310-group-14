# Test data


# install.packages("here")
# library(here)
# library(testthat)
source("Tests/testhelper.R")
source("R/02_get_all_stars.R")

test_that("clean_all-stars should return correct data frame", {
  expect_equivalent(season_filter(test1, Year, 2011, 2016), output1)
})

test_that(" `clean_all-stars` should throw an error when incorrect types
are passed to `data` and `from` or `to` arguments", {
  expect_error(season_filter(test1, Year, "year", 2016))
  expect_error(season_filter(vector, Year, 2005, 2016))
})

test_that("`clean_all-stars` should return a data frame", {
  expect_s3_class(season_filter(test1, Year, 2011, 2016), "data.frame")
})
