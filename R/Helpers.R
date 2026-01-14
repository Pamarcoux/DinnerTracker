count_visits <- function(df,person) {
  df |> 
    filter(Name==person) |> 
    distinct(Date, Diner_id, Name) |> 
    count(Name) |> 
    pull()
}

dining_partners <- function(df, person) {
  df %>%
    filter(Diner_id %in% df$Diner_id[df$Name == person]) %>%
    filter(Name != person) %>%
    group_by(Name) |> 
    summarise(N_meeting = n())
}

meal_eaten <- function(df, person) {
  df_person <-  df |> 
    filter(Name == person)
    
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
