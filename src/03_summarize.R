doc <- "summarize mean and proportion
Usage: src/03_summarize.R --outpath=<outpath>
  
Options:
--outpath=<outpath> Path to directory where the plots and model should be saved
" 


library(tidyverse)
source(here::here("src/proportion.r"))
library(docopt)
library(GGally)

opt <- docopt(doc)

main <- function(outpath){
  
#summarize the averages across the variables
  data<- read.csv(here::here("data/processed/training_set.csv"))
  averages <- group_by(data, Is_All_Star) %>% 
    summarize(across(MIN:TOV, mean))
  write_csv(averages,file.path(outpath,"averages.csv"))
              
  proportion_summary <- NBASTARS::proportion(data, Is_All_Star)
  
  write_csv(proportion_summary,file.path(outpath,"proportion.csv"))
  
  options(repr.plot.width = 14, repr.plot.height = 9) 
  plot <- ggpairs(data, columns = 3:9, legend = 1,
                  ggplot2::aes(color = Is_All_Star, alpha = 0.4),
                  upper = list(continuous = "points", wrap("cor", size = 2.5))) +
    labs(title = "Player Distributions of Various Players Statistics", fill = "Players' type") +
    theme(plot.title = element_text(size = 25))
  
  ggsave(here::here(paste0(outpath, "/stats_distributions.png")), plot, width = 11)
  
}

main(opt[["--outpath"]])
#main("results")
