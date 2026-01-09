source(here('src/helpers.R'))

if (!require("pacman")) install.packages("pacman")

pacman::p_load(
  tidyverse, here, rio, shiny,lubridate
)

Data_diner <- import(here('data/Data_diner.tsv'),
                     na = c("", "NA")) |> 
  mutate(Date = as_date(Date,format = "%d/%m/%Y")) |> 
  mutate(across(where(is.character), ~na_if(.x, "")))

count_visits(Data_diner,"Claire")
dining_partners(Data_diner,"Claire")
meal_eaten(Data_diner,"Claire")
