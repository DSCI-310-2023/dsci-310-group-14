"Fit the new specification with an optimal k value and the recipe to train 
 the model + assess the quality of the model
Usage: src/06_fit.R --training=<training> --test=<test> --recipe=<recipe>  --model=<model>  --outpath=<outpath>
  
Options:
--training=<training> Path (including filename) to training data 
--test=<test> Path (including filename) to testing data 
--recipe=<recipe> Path (including filename) to the recipe
--model=<model> Path (including filename) to the model 
--outpath=<outpath> Path to directory where the plots and model should be saved
" -> doc
library(tidyverse)
library(GGally)
library(tidymodels)
library(themis)
library(docopt)

opt <- docopt(doc)

main <- function(training,test,recipe, model, outpath) {
  data_training<- read.csv(training)
  data_testing<- read.csv(test)
  data_recipe<- readRDS(recipe)
  data_fit <- readRDS(model)
#Plot of accuracy vs k to find best k  
  data_plot <- ggplot(data_fit, aes(x = neighbors, y = mean)) +
    geom_line() +
    geom_point() +
    xlab("Number of K") +
    ylab("Accuracy") + theme(text = element_text(size = 16)) + 
    ggtitle("Estimated accuracy versus the number of neighbors")
  
  ggsave(here::here(paste0(outpath, "/accuracy_vs_k.png")), data_plot)
  
#New recipe with k = 61
  data_updated_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = 61) %>%
    set_engine("kknn") %>%
    set_mode("classification")
  
#Fit new recipe and specification to make a workflow
  data_updated_fit <- workflow() %>%
    add_recipe(data_recipe) %>%
    add_model(data_updated_spec) %>%
    fit(data_training)
  
#Use the trained model to predict on testing data
  data_prediction <- predict(data_updated_fit, data_testing) %>%
    bind_cols(data_testing)
  
#assess the accuracy of the model 
  # data_metrics <- metrics(data_prediction, truth = Is_All_Star, estimate = .pred_class) %>%
  #    filter(.metric == "accuracy") %>%
  #    select(.estimate) %>%
  #    pull() 
  
#confusion matrix of the classifier results
  data_prediction$Is_All_Star <- as.factor(data_prediction$Is_All_Star)
  confusion <- conf_mat(data_prediction, truth = Is_All_Star, estimate = .pred_class)
  
  saveRDS(confusion, file = here::here(paste0(outpath, "/prediction_quality.rds")))
  
#visualization of the confusion matrix
  confusion_tibble <- tibble(all_star = c("All Star", "All Star", "Regular", "Regular"), 
                             correctness = c(" Incorrect", "Correct", " Incorrect", "Correct"),
                             value = c(3, 23, 59, 237))
  confusion_graph <- ggplot(confusion_tibble, aes(x = all_star, y = value, fill = correctness)) +
    geom_bar(stat = "identity", position = "fill") +
    labs(x = "Type of Player", y = "Correct : Incorrect Prediction Ratio", fill = "Legend", title = "Correct vs Incorrect Ratio of All Star and Regular")
  
  ggsave(here::here(paste0(outpath, "/confusion_graph.png")), confusion_graph, width = 5, height = 3)
}

main(opt[["--training"]], opt[["--test"]],opt[["--recipe"]],opt[["--model"]],opt[["--outpath"]])
#main(here::here("data/training_set.csv"),here::here("data/testing_set.csv"),here::here("results/data_recipe.rds"),here::here("results/find-k.rds"), "results")