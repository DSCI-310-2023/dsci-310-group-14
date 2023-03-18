#' Download data in the URL to a local path as a csv file
#' 
#' @param url where the data is stored
#' @param outname file path + file name where it is written
#' 
#' Usage: > --url=<url> --outname=<outname>
#' @examples
#' download_data(url, data/nba_player_stats.csv)



download_data <- function(url, outname) {
  if (!is.character(outname)) {
    stop("outname should be of type string")
  }
  data <- read.csv(url)
  write.csv(data,here::here(paste0('data/', outname)))
}

