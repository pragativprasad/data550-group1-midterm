data: code/01_data_cleaning.R raw_data/covid_sub.csv
	Rscript code/01_data_cleaning.R 
	
descriptive: code/02_descriptive_stat.R output/data_cleaned.rds data
	Rscript code/02_descriptive_stat.R
	
regression: code/03_model.R output/data_cleaned.rds regression
	Rscript code/03_model.R
	
visualize: code/04_visualization.R output/data_cleaned.rds output/model_1.rds output/model_2.rds data regression
	Rscript code/04_visualization.R
	
report.html: code/05_run_report.R report.Rmd data descriptive regression visualize
	Rscript 05_run_report.R
	
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html && rm -f output/*.png
	
install: 
	