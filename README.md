# Synchronizing the Package Repository
- run `make install` in the terminal

# Code Description

`code/00_clean_data.R`
- read raw data from `raw_data/` folder
- save clean data in `derived_data/` folder

`code/01_make_table.R`
- read clean data from `derived_data/` folder
- save table 1 in `output/` folder

`code/02_models.R`
- read clean data from `derived_data/` folder
- save logistic regression model in `output/` folder

`code/03_make_bar_chart.R`
- read clean data from `derived_data/` folder
- create and save the bar chart to `output/` folder

`code/04_render_report.R`
- render `code/Final_project_2.Rmd` 
- save compiled report in `output/` folder

`code/Final_project_2.Rmd`
- read data, tables, and figures from respective locations
- display results for production report