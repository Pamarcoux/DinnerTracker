ui <- page_sidebar(
  # App title ----
  title = "DinerTracker",
  fillable = TRUE,  

  # Sidebar panel for inputs ----
  sidebar = sidebar(
      # sélectionneur pour la personne
      selectInput(
        inputId = "Select_Guest",
        label = "Select Guest",
        choices = List_person,
        selected = List_person[1],
        multiple = FALSE
      ),
      # sélecteur pour le diner
      selectInput(
        inputId = "Select_Diner",
        label = "Sélectionnez le diner",
        choices = List_diner, 
        selected = "All",
        multiple = TRUE
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
          col_widths = c(2, 4.5, 4.4) 

    )
    
  )