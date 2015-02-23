library(shiny)

classData <- numeric()
total <- 125

shinyServer(function(input, output){
  
  output$score <- renderPrint({
    cat(total-input$numMiss, "/", total, " = ", (total-input$numMiss)/total, sep="")
  })
  
  output$data <- renderPrint({
    input$submitButton
    isolate(cat(total-input$numMiss, "/", total, " = ", (total-input$numMiss)/total, sep=""))
  })
  
  
  
})