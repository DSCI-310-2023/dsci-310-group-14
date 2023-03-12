#' Function to filter and clean dataset based on specified years
#' 
#' 
#' @param from columns to end
#' @param to to reduce overplotting
#' 
#' 
#' @example getallstars(2011,2015)

library("tidyverse")
source(here("R/01_season_filter.R"))
getallstars <- function(from,to) {
  players <- read.csv("https://raw.githubusercontent.com/RayNguyent/DSCI-100-project/urls/data/nba_player_stats.csv")
  all_stars <- read.csv("https://raw.githubusercontent.com/RayNguyent/DSCI-100-project/develop/data/all_stars_2000_2016.csv")
  all_stars_filtered <- season_filter(all_stars, Year, from, to) %>%
    select(Year, Player) %>% 
    mutate(Is_All_Star = "All Star")
  combined_data <- left_join(players, all_stars_filtered, by = c("Year", "Player")) %>% 
    replace(is.na(.), "Regular") %>% 
    mutate(Is_All_Star = as_factor(Is_All_Star))
  write.csv(combined_data,"data/all_stars_data.csv")
  return(combined_data)
}


