library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Student Grades"),
  
  sidebarPanel(
    textInput("numMiss", "Number of Points Missed:", "0"),
    actionButton("submitButton", "Add to Data Set"),
    br(),
    br(),
    textOutput("sumMissed"),
    br(),
    textOutput("score"),
    br()
  ),
  
  mainPanel(
    plotOutput("dataPlot"),
    textOutput("data")
  )
  
))