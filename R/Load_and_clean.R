Data_diner <- readr::read_tsv(here::here('data/Data_diner.tsv'),
                     na = c("", "NA")) |> 
  dplyr::mutate(Date = lubridate::as_date(Date,format = "%d/%m/%Y")) |> 
  dplyr::mutate(across(where(is.character), ~dplyr::na_if(.x, "")))
