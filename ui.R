library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Titanic Predict"),
  
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(
    selectInput("Pclass", "Choose a class:
                            1 = Upper
                            2 = Middle
                            3 = Lower", 
                choices = c("1", "2", "3")),
    
    selectInput("Sex", "Choose sex:", 
                choices = c("male", "female")),
    
    numericInput("Age", "Age of the passager:", 10),
    
    numericInput("SibSp", "SibSp:
                         Sibling = brother, sister, stepbrother, stepsister
                         Spouse = husband, wife (mistresses and fiancés were ignored", 0),
    
    numericInput("Parch", "Parch:
                         Parent = mother, father
                        Child = daughter, son, stepdaughter, stepson
                Some children travelled only with a nanny, therefore parch=0 for them", 0),
    
    numericInput("Fare", "Fare", 0),
    
    selectInput("Title", "Title:", 
                choices = c("Col" , "Dr", "Lady", "Master", "Mile", "Miss",
                                 "Mlle", "Mr", "Mrs", "Ms", "Rev", "Sir")),
    selectInput("Embarked", "Embarked:", 
                 choices = c("C", "Q", "S"))
               ),
  
    
    mainPanel(
    
    textOutput('tx',container=h1),
    tableOutput("values"),
    textOutput('th',container=h1),
    textOutput('to',container=h1)
    
  )
))