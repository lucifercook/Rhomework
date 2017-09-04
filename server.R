library(shiny)
# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  
  # Reactive expression to compose a data frame containing all of the values
  sliderValues<- reactive({
    # Compose data frame
    data.frame(
      Name = c("Pclass", 
               "Sex",
               "Age",
               "SibSp",
               "Parch",
               "Fare",
               "Embarked",
               "Title"
      ),
      Value = as.character(
              c(input$Pclass, 
                input$Sex,
                input$Age,
                input$SibSp,
                input$Parch, 
                input$Fare,
                input$Embarked,
                input$Title))
  )
    }) 
  
  
  result<-reactive({ifelse(input$Pclass>2,"alive","die")})
 
  # Show the values using an HTML table
  output$values <- renderTable({
    sliderValues()
  })
  output$tx <- renderText({
    " Passager's Data"
  })
  output$th <- renderText({
    "Predict Result"
  })
  output$to <- renderText({
    result()
   
  })
})