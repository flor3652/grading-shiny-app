library(shiny)

classData <- numeric()
total <- 300 # The total number of points on the test
classData[1] <- 0

shinyServer(function(input, output){
  
  missed <- reactive({
    eval(parse(text=input$numMiss))
  })
  
  output$sumMissed <- renderPrint({
    cat("Total Missed:", missed())
  })
  
  output$score <- renderPrint({
    cat(total-missed(), "/", total, " = ", (total-missed())/total, sep="")
  })
  
  entered_score <- reactive({
    (total-missed())/total
  })
  
  update_data <- reactive({
    input$submitButton
    
    isolate(
    classData[input$submitButton] <<- entered_score()
    )
    
    classData
  })
  
  output$data <- renderText({
    update_data()
  })
  
  output$dataPlot <- renderPlot({
    hist(update_data(), breaks = c(0, .6, .7, .8, .9, 1), xlim = c(.5,1), freq=TRUE)
  })
  
})