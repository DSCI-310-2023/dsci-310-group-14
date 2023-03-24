library(tidyverse)
source(here::here("src/proportion.r"))
#summarize the averages across the variables
s

main <- function(data, outpath){
    #summarize the averages across the variables
    averages <- group_by(data, Is_All_Star) %>% 
      summarize(across(MIN:TOV, mean))
    write_csv(averages,file.path(outpath,"averages.csv")
              
    proportion_summary <- proportion(data, Is_All_Star)
    write_csv(proportion_summary,file.path(outpath,"averages.csv"))
    }


