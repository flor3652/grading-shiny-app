library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Student Grades"),
  
  sidebarPanel(
    numericInput("numMiss", "Number of Points Missed:", 0),
    actionButton("submitButton", "Add to Data Set:"),
    br(),
    br(),
    textOutput("score")
  ),
  
  mainPanel(
    
  )
  
))