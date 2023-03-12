#' Filter for seasons
#' 
#' Filter for an interval of years 
#' 
#' @param data data frame
#' @param col1 column that stores seasons 
#' @param from start year
#' @param to end year
#' 
#' @return a data frame.
#' 
#' @examples
#'clean_all_stars(data, Year, 2011,2015)

season_filter <- function(data, col, from, to) {
  if (!is.data.frame(data)) {
    stop("data should be a data frame")
  }
  if (!is.numeric(from) | !is.numeric(to)) {
    stop("from or to should be of type numeric")
  }
  data %>% dplyr::filter({{col}} >= from & {{col}} <= to)
}