# Final HTML report
output/Final_project_2.html: code/Final_project_2.Rmd code/04_render_report.R derived_data/data_clean.rds output/table_one.rds output/logistic_regression.rds output/bar_chart.png        
	Rscript code/04_render_report.R

# Cleaned data
derived_data/data_clean.rds: raw_data/brfss2020.csv code/00_clean_data.R
	Rscript code/00_clean_data.R

# Summary table
output/table_one.rds: derived_data/data_clean.rds code/01_make_table.R
	Rscript code/01_make_table.R

# Logistic regression model
output/logistic_regression.rds: derived_data/data_clean.rds code/02_models.R
	Rscript code/02_models.R

# Bar chart
output/bar_chart.png: derived_data/data_clean.rds output/logistic_regression.rds code/03_make_bar_chart.R
	Rscript code/03_make_bar_chart.R

# Clean
.PHONY: clean
clean:
	rm output/*.rds && \
	rm output/*.png && \
	rm output/*.html
	
