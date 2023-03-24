doc <- "summarize mean and proportion
Usage: src/03_summarize.R --outpath=<outpath>
  
Options:
--outpath=<outpath> Path to directory where the plots and model should be saved
" 


library(tidyverse)
source(here::here("src/proportion.r"))
library(docopt)

opt <- docopt(doc)

main <- function(outpath){
  
#summarize the averages across the variables
  data<- read.csv(here::here("data/training_set.csv"))
  averages <- group_by(data, Is_All_Star) %>% 
    summarize(across(MIN:TOV, mean))
  write_csv(averages,file.path(outpath,"averages.csv"))
              
  proportion_summary <- proportion(data, Is_All_Star)
  write_csv(proportion_summary,file.path(outpath,"proportion.csv"))
}

main(opt[["--outpath"]])
#main("results")
