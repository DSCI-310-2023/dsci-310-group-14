doc <- "Split the dataset into training and testing data to perform cross-validation
Create specification and recipe to fit the model and find the best k.
Usage: src/04.modelling.R --data=<data> --outpath=<outpath>

Options:
--data=<data>     Path (including filename) to training data
--outpath=<outpath> Path to directory where the plots and model should be saved
"
library(tidyverse)
library(GGally)
library(tidymodels)
library(themis)
library(docopt)

opt <- docopt(doc)
set.seed(2022)

main <- function(data, outpath) {
  data_training <- read.csv(data)
  # Split training data into 5 folds to run cross-validation
  data_fold <- vfold_cv(data_training, v = 5, strata = Is_All_Star)

  # Create a range of possible k values
  k_vals <- tibble(neighbors = seq(from = 1, to = 70, by = 5))

  # Create the recipe and standardise the data and reweigh the proportion of All-stars and
  # versus regular players
  data_recipe <- recipe(Is_All_Star ~ MIN + PTS + FGM + FGA + FTM + FTA + TOV, data = data_training) %>%
    step_scale(all_predictors()) %>%
    step_center(all_predictors()) %>%
    step_upsample(Is_All_Star, over_ratio = 1, skip = TRUE)

  saveRDS(data_recipe, file = here::here(paste0(outpath, "/data_recipe.rds")))

  # Create specification
  data_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) %>%
    set_engine("kknn") %>%
    set_mode("classification")

  # Fit the recipe and specification to find model for a range of different k values
  data_fit <- workflow() %>%
    add_recipe(data_recipe) %>%
    add_model(data_spec) %>%
    tune_grid(resamples = data_fold, grid = k_vals) %>%
    collect_metrics() %>%
    filter(.metric == "accuracy")

  saveRDS(data_fit, file = here::here(paste0(outpath, "/find-k.rds")))
}

main(opt[["--data"]], opt[["--outpath"]])
# main(here::here("data/training_set.csv"), "results")
