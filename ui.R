library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Student Grades"),
  
  sidebarPanel(
    numericInput("numMiss", "Number of Points Missed:", 0),
    textOutput("score")
  ),
  
  mainPanel(
    
  )
  
  
))