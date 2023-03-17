library(ggplot2)
library(GGally)

#' Function to visualize the distributions for features and columns 
#' 
#' Display all Player Distributions of Various Players Statistics
#' 
#' @param df data frame
#' @param neighbors number of neighbors
#' @param acc accuracy value
#' @param title title for the plot
#' 
#' @return plot
#' 
#' @examples
#'visualize_knn(data_fit, neighbors = neighbors, acc = mean, title = Plot of estimated accuracy versus the number of neighbors)

visualize_knn <- function(df, x, y, title){
  plot <- ggplot(df) +
    geom_line(aes(x = x, y = y)) +
    geom_point() +
    labs(title = title)+
    xlab("Number of K") +
    ylab("Accuracy") + theme(text = element_text(size = 18))# + 
    #ggtitle(title)
  return (plot)
}

#' Function to visualize the distributions for features and columns 
#' 
#' Display all Player Distributions of Various Players Statistics
#' 
#' @param df data frame
#' @param feature_start columns to start from to visualize
#' @param feature_end columns to end
#' @param alpha to reduce overplotting
#' 
#' @return NA
#' 
#' @examples
#'visualize_distributions(data_training, feature_start = 3, feature_end = 9, alpha = 4)


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



