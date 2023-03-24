#' Function to summarize proportion of all star player compared to regular players
#' 
#' 
#' @param data data to summarize
#' @param column to group_by
#' 
#' 
#' @example proportion(datatraining,is_all_stars)

library(tidyverse)
proportion <- function(data,column) {
  proportion <- group_by(data,{{column}}) %>% 
    summarize(Counts = n()) %>% 
    mutate(Percent = 100*Counts/nrow(data))
}