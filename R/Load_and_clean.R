Data_diner <- import(here::here('data/Data_diner.tsv'),
                     na = c("", "NA")) |> 
  dplyr::mutate(Date = as_date(Date,format = "%d/%m/%Y")) |> 
  dplyr::mutate(across(where(is.character), ~na_if(.x, "")))
