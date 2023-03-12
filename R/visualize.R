library(ggplot2)
visualize_distributions <- function(df, feature_start, feature_end, alpha){
  ggpairs(df, columns = feature_start:feature_end, legend = 1,
          ggplot2::aes(color = Is_All_Star, alpha = alpha),
          upper = list(continuous = "points", wrap("cor", size = 2.5))) +
    labs(title = "Player Distributions of Various Players Statistics", fill = "Players' type") +
    theme(plot.title = element_text(size = 25))
}

# alpha <- 0.4
# feature_start <- 3
# feature_end <- 9