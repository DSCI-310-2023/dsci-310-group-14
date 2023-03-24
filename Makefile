
all: results/find-k.rds results/accuracy_vs_k.png results/prediction_quality.rds results/confusion_graph.png

#load 2 dataset and combine
data/nba_allstars.csv: src/01_load_data.R
	Rscript src/01_load_data.R

#clean data + split
data/training_set.csv data/testing_set.csv: data/nba_allstars.csv src/02_clean_data.R
	Rscript src/02_clean_data.R

#Cross-validation to find k
results/data_recipe.rds results/find-k.rds: data/training_set.csv src/05_modelling.R
	Rscript src/05_modelling.R --data=data/training_set.csv --outpath=results

#Fit the model and asssess quality
results/accuracy_vs_k.png results/confusion_graph.png results/prediction_quality.rds: results/find-k.rds src/06_fit.R data/training_set.csv data/testing_set.csv results/data_recipe.rds
	Rscript src/06_fit.R --training=data/training_set.csv --test=data/testing_set.csv --recipe=results/data_recipe.rds --model=results/find-k.rds --outpath=results
	
clean: 
	rm -rf data
	rm -rf results

