library(tidyverse)
library(tidymodels)

set.seed(2022)
#source(here::here("src/season_filter.R"))


#read data from data folder
data <- readr::read_csv(here::here("data/processed/nba_allstars.csv"))

#filter for year segment and clean data
select_data <- NBASTARS::select_to_from(data,Year,2011,2015) %>%
  filter(Player != "0") %>%
  select(Year, Player, MIN, PTS, FGM, FGA, FTM, FTA, TOV, Is_All_Star)


NBASTARS::split_data(select_data, 0.7, "Is_All_Star")

readr::write_csv(data_training,file = here::here("data/processed/training_set.csv"))
readr::write_csv(data_testing,file = here::here("data/processed/testing_set.csv"))


