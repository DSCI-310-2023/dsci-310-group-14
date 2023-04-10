source("Tests/testhelper.R")
source("R/03_visualize.R")
library("testthat")

test_that("title for visualize_knn to be tested", {
  test_plot <- visualize_knn(knn_acc_sample, neighbors, acc, title = "Plot title")
  # print(test_plot$title)
  expect_equal(test_plot$label$title, "Plot title")
})
