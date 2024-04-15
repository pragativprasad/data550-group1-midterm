here::i_am(
  #! TO DO: add appropriate location
  "code/05_render_report.R"
)

library(rmarkdown)

render(here::here("report.Rmd"))
