#' 
#' Split the dataset into training and testing data to perform cross-validation
#' Create specification and recipe to fit the model and find the best k.
#' 
#

set.seed(2022)

data_split <- initial_split(selected_combined_data, prop = 0.7, strata = Is_All_Star)
data_training <- training(data_split)
data_testing <- testing(data_split)

#Split training data into 5 folds to run cross-validation
data_fold <- vfold_cv(data_training, v = 5, strata = Is_All_Star)

#Create a range of possible k values
k_vals <- tibble(neighbors = seq(from = 1, to = 70, by = 5))

#Create the recipe and standardise the data and reweigh the proportion of All-stars and
# versus regular players
data_recipe <- recipe(Is_All_Star ~ MIN + PTS + FGM + FGA + FTM + FTA + TOV, data = data_training) %>%
  step_scale(all_predictors()) %>%
  step_center(all_predictors()) %>% 
  step_upsample(Is_All_Star, over_ratio =1, skip = TRUE)

#Create specification 
data_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) %>%
  set_engine("kknn") %>%
  set_mode("classification")

#Fit the recipe and specification to find model for a range of different k values
data_fit <- workflow() %>%
  add_recipe(data_recipe) %>%
  add_model(data_spec) %>%
  tune_grid(resamples = data_fold, grid = k_vals) %>%
  collect_metrics() %>%
  filter(.metric == "accuracy")