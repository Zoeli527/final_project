here::i_am("code/04_render_report.R")

library(rmarkdown)

render(
  input = here::here("code", "Final_project_2.Rmd"),
  output_file = "Final_project_2.html",
  output_dir = here::here("output")
)