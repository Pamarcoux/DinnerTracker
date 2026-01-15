library(shiny)
library(dplyr)
library(bslib)
library(here)

# ------ Load data -------------------------------------------------------------
source(here('R/Load_and_clean.R'))

# ------ Global variables ------------------------------------------------------
List_person <- Data_diner |> select(Name) |> distinct() |> pull()
List_diner <- Data_diner |> select(Diner_name) |> distinct() |> pull()

# ------ Global variables ------------------------------------------------------
source(here('R/Helpers.R'))