library(shiny)

classData <- numeric()
total <- 125 # The total number of points on the test
classData[1] <- 0

shinyServer(function(input, output){
  
  output$score <- renderPrint({
    cat(total-input$numMiss, "/", total, " = ", (total-input$numMiss)/total, sep="")
  })
  
  entered_score <- reactive({
    (total-input$numMiss)/total
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