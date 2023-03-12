#' Specification
#' 
#' Set up specification for KNN algorithm of classification mode
#' 
#' @param neighbor number of neighbors or function tune() to find best K
#' 
#' @examples
#'specification(50)
specification <- function(neighbor) {
  nearest_neighbor(weight_func = "rectangular", neighbors = neighbor) %>%
    set_engine("kknn") %>%
    set_mode("classification")
}