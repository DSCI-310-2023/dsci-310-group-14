#' Function to fit a data recipe and model specification to workflow and run CV tests
#' 
#' @param recipe data recipe
#' @param spec model specification
#' 
#' @return metrics on model fitting
#' 
#' @examples
#' fit_model(data_recipe, model_specification)



fit_model <- function(recipe, spec) {
  workflow() %>%
    add_recipe(recipe) %>%
    add_model(spec) %>%
    tune_grid(resamples = data_fold, grid = k_vals) %>%
    collect_metrics() %>%
    filter(.metric == "accuracy")
}