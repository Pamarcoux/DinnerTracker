count_visits <- function(df,person) {
  df |> 
    filter(Name==person) |> 
    distinct(Date, Diner_id, Name) |> 
    count(Name, Name = "n_visits")
}

dining_partners <- function(df, person) {
  df %>%
    filter(Diner_id %in% df$Diner_id[df$Name == person]) %>%
    filter(Name != person) %>%
    group_by(Name) |> 
    summarise(N_meeting = n())
}

meal_eaten <- function(df, person) {
  df %>%
    filter(Name == person) %>%
    summarise(
      Entree  = list(discard(Entree, is.na)),
      Plat    = list(discard(Plat, is.na)),
      Dessert = list(discard(Dessert, is.na))
    ) %>%
    as.list()
}
