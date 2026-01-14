server <- function(input, output, session) {
  
  # Meet Table
  output$table_meet <- renderTable({
    
    req(input$Select_Guest)   # ensures a selection exists
    
    dining_partners(df = Data_diner,
                    person = input$Select_Guest)
  })
  
  #Number of Visit
  output$number_visit <- renderText(
    count_visits(df = Data_diner,
                 person = input$Select_Guest))
  
  #Meal Eaten
  meals_reactive <- reactive({
    req(input$Select_Guest)
    meal_eaten(df = Data_diner, input$Select_Guest)
  })

  output$Entree <- renderTable({
    meals_reactive()$Entree
  })
  
  output$Plat <- renderTable({
    meals_reactive()$Plat
  })
  
  output$Dessert <- renderTable({
    meals_reactive()$Dessert
  })
  
  
}