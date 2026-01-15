count_visits <- function(df, person) {
  df |>
    dplyr::filter(Name == person) |>
    dplyr::distinct(Date, Diner_id, Name) |>
    dplyr::count(Name) |>
    dplyr::pull(n)
}

dining_partners <- function(df, person) {
  df |>
    dplyr::filter(
      Diner_id %in% df$Diner_id[df$Name == person],
      Name != person
    ) |>
    dplyr::group_by(Name) |>
    dplyr::summarise(
      N_meeting = dplyr::n(),
      .groups = "drop"
    )
}


meal_eaten <- function(df, person) {
  df_person <- df |>
    dplyr::filter(Name == person)
  
  list(
    Entree = tibble::tibble(
      Entree = df_person$Entree[!is.na(df_person$Entree)]
    ),
    Plat = tibble::tibble(
      Plat = df_person$Plat[!is.na(df_person$Plat)]
    ),
    Dessert = tibble::tibble(
      Dessert = df_person$Dessert[!is.na(df_person$Dessert)]
    )
  )
}

