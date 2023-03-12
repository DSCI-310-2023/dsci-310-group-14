#Test data
test1 <- data.frame(Year = c(2002,2003,2009,2011,2012,2016,2017),
                    Player = c("Kevin Durant", "Kobe Bryant", "Michael Jordan", "Shaq O'neil",
                               "Steph Curry", "Yao Ming","Ray Nguyen"),
                    Height = c(190,191,192,194,200,210,170))
vector <- c(2,3,4) 

output1 <- data.frame(Year = c(2011,2012,2016),
                      Player = c("Shaq O'neil", "Steph Curry", "Yao Ming"))

#install.packages("here")
#library(here)                    
#library(testthat)
source(here("R/clean_all-stars.R"))

test_that("clean_all-stars should return correct data frame", {
  expect_equivalent(clean_all_stars(test1,Year,Player,2011,2016), output1)
})

test_that(" `clean_all-stars` should throw an error when incorrect types 
are passed to `data` and `from` or `to` arguments", {
  expect_error(clean_all_stars(test1,Year,Player,"year",2016))
  expect_error(clean_all_stars(c,Year,Player,2005,2016))})

test_that("`clean_all-stars` should return a data frame", {
  expect_s3_class(clean_all_stars(test1,Year,Player,2011,2016), "data.frame")
})
