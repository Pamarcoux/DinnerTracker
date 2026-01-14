ui <- page_sidebar(
  # App title ----
  title = "DinerTracker",
  fillable = TRUE,  
  
  theme = bs_theme(
    version = 5,
    bootswatch = "flatly",   # clean, professional
    base_font = font_google("Inter"),
    heading_font = font_google("Inter"),
    primary = "#2C3E50"
  ),

  # Sidebar panel for inputs ----
  sidebar = sidebar(
    width = 300,
    
    h5("Filters"),
    selectInput(
      inputId = "Select_Guest",
      label = "Guest",
      choices = List_person,
      selected = List_person[1]
    ),
    
    hr(),
    
    p(
      "Explore dinner history, menus, and social interactions.",
      class = "text-muted"
    )
  ),
        layout_columns( 
          # Card 1 : Number of Visit
          card(
            card_header("Number of Visit"),
            
             textOutput("number_visit")
            ), 
          # Card 2 : Meal Eaten
          card(
            card_header("Menu"),
              card(
                tableOutput("Entree")
                ), 
            card(
              tableOutput("Plat")
            ),  
            card(
              tableOutput("Dessert")
            ), 
              ), 
          
          # Card 3 : Guest Met
          card(card_header("Guests Met"),
               tableOutput("table_meet")), 
          col_widths = c(2,5,5) 

    )
    
  )