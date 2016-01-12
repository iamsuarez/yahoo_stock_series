library(shiny)
library("quantmod")
source("helpers.R")
shinyServer(function(input,output){
  datainput<-reactive({
    getSymbols(input$symbol,src="yahoo",
               from=input$date[1],to=input$date[2],
               auto.assign = FALSE)
  })
  finalinput<-reactive({
    if (!input$adjust) return(datainput())
    adjust(datainput())
  })
  output$plot<-renderPlot({
    chartSeries(finalinput(),theme = chartTheme("white"), 
                type = "line", log.scale=input$log,TA=NULL)
  })
  
  
  
  
  
})
