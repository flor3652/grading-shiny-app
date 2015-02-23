library(shiny)

shinyServer(function(input, output){
  
  output$score <- renderPrint({
    total <- 125
    cat(total-input$numMiss, "/", total, " = ", (total-input$numMiss)/total, sep="")
  })
  
})