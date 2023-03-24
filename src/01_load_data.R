library(tidyverse)

#read data from repo
players <- read.csv("https://raw.githubusercontent.com/RayNguyent/DSCI-100-project/urls/data/nba_player_stats.csv")
all_stars <- read.csv("https://raw.githubusercontent.com/RayNguyent/DSCI-100-project/develop/data/all_stars_2000_2016.csv")

#filter data for specified years
all_stars_filtered <- all_stars %>% select(Year, Player) %>% 
  mutate(Is_All_Star = "All Star")

#combine players data with all_stars data
combined_data <- left_join(players, all_stars_filtered, by = c("Year", "Player")) %>% 
  replace(is.na(.), "Regular") %>% 
  mutate(Is_All_Star = as_factor(Is_All_Star))

if (!dir.exists("data")) {
  dir.create(here::here("data"))
}
#write combined data to csv
readr::write_csv(combined_data,here::here(paste0("data", "/nba_allstars.csv")))
