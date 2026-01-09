
if (!require("pacman")) install.packages("pacman")

pacman::p_load(
  tidyverse, here, rio, shiny,lubridate
)

Data_diner <- import(here('data/Data_diner.tsv'),
                     na = c("", "NA")) |> 
  mutate(Date = as_date(Date,format = "%d/%m/%Y")) |> 
  mutate(across(where(is.character), ~na_if(.x, "")))