#' Clean all stars data frame
#' 
#' Filter for an interval of years and select for Year and Player
#' column
#' 
#' @param data all stars data frame
#' @param col1 column names "Year"
#' @param col2 column names "Player"
#' @param from start year
#' @param to end year
#' 
#' @return a data frame.
#' 
#' @examples
#'clean_all_stars(data,Year,Play, 2011,2015)

clean_all_stars <- function(data, col1, col2, from, to) {
  if (!is.data.frame(data)) {
    stop("data should be a data frame")
  }
  if (!is.numeric(from) | !is.numeric(to)) {
    stop("from or to should be of type numeric")
  }
  data %>% dplyr::filter({{col1}} >= from & {{col1}} <= to) %>%
    dplyr::select({{col1}},{{col2}})
}