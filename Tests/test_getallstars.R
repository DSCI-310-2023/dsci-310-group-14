# install.packages("here")
# library(here)
# library(testthat)
source(here("R/01_season_filter.R"))
source(here("R/02_get_all_stars.R"))
source(here("Tests/testhelper.R"))

test_that("clean_all-stars should return correct data frame", {
  expect_equivalent(getallstars(2011, 2016), testdata)
})
