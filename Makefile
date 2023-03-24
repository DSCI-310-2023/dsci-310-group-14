# Milestone 3
# Makefile 

#all:
all: results/find-k.rds results/accuracy_vs_k.png results/prediction_quality.rds results/confusion_graph.png 

# load the data and write it to nba_all_stars.csv
data/nba_all_stars.csv: src/01_load_data.R
	Rscript src/01_load_data.R

# use the data/nba_all_stars.csv, 02_clean_data and write to data/trainig_set.csv and data/testing_set.csv
data/trainig_set.csv data/testing_set.csv: src/02_clean_data.R data/nba_allstars.csv 
	Rscript src/02_clean_data.R


	