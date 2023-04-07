library(tidyverse)

#read data from repo
players <- read.csv("https://raw.githubusercontent.com/rhysong/dsci-310-group-14/main/data/raw/nba_player_stats.csv")
all_stars <- read.csv("https://raw.githubusercontent.com/rhysong/dsci-310-group-14/main/data/raw/all_stars_2000_2016.csv")

#filter data for specified years
all_stars_filtered <- all_stars %>% select(Year, Player) %>% 
  mutate(Is_All_Star = "All Star")

#combine players data with all_stars data
combined_data <- left_join(players, all_stars_filtered, by = c("Year", "Player")) %>% 
  replace(is.na(.), "Regular") %>% 
  mutate(Is_All_Star = as_factor(Is_All_Star))

if (!dir.exists("data/processed")) {
  dir.create(here::here("data/processed"))
}
if (!dir.exists("results")) {
    dir.create(here::here("results"))
}


#write combined data to csv
readr::write_csv(combined_data,here::here(paste0("data/processed", "/nba_allstars.csv")))
