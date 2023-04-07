
all: results/find-k.rds results/accuracy_vs_k.png results/prediction_quality.rds results/confusion_graph.png results/averages.csv results/proportion.csv NBA_All-Star_Report.html results/stats_distributions.png

#load 2 dataset and combine
data/processed/nba_allstars.csv: src/01_load_data.R
	Rscript src/01_load_data.R

#clean data + split
data/processed/training_set.csv data/processed/testing_set.csv: data/processed/nba_allstars.csv src/02_clean_data.R
	Rscript src/02_clean_data.R
	
#summarize
results/averages.csv results/proportion.csv results/stats_distributions.png: data/processed/training_set.csv src/03_summarize.R
	Rscript src/03_summarize.R	--outpath="results"

#Cross-validation to find k
results/data_recipe.rds results/find-k.rds: data/processed/training_set.csv src/04_modelling.R
	Rscript src/04_modelling.R --data=data/processed/training_set.csv --outpath=results

#Fit the model and asssess quality
results/accuracy_vs_k.png results/confusion_graph.png results/prediction_quality.rds: results/find-k.rds src/05_fit.R data/processed/training_set.csv data/processed/testing_set.csv results/data_recipe.rds
	Rscript src/05_fit.R --training=data/processed/training_set.csv --test=data/processed/testing_set.csv --recipe=results/data_recipe.rds --model=results/find-k.rds --outpath=results

# render R Markdown report in HTML and PDF
NBA_All-Star_Report.html: NBA_All-Star_Report.Rmd doc/references.bib
	Rscript -e "rmarkdown::render('NBA_All-Star_Report.Rmd', c('bookdown::html_document2'))"

clean: 
	rm -rf data/processed
	rm -rf results
	rm -rf NBA_All-Star_Report.html

