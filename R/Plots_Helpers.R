plot_visits <- function(df) {
  df %>%
    distinct(Date, Table_id, Name) %>%
    count(Name) %>%
    ggplot(aes(Name, n)) +
    geom_col() +
    labs(
      x = "Person",
      y = "Number of visits"
    ) +
    theme_minimal()
}
