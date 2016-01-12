shinyUI(fluidPage(
  titlePanel("stockyahoo"),
  sidebarLayout(
    sidebarPanel(
      helpText("select a stock to examine. 
        Information will be collected from yahoo finance."),
      textInput(inputId="symbol",label="Symbol",value="AAPL"),
      dateRangeInput(inputId="date",label="Select the time",
                     start="2012-01-01",end=as.character(Sys.Date()),
                     format="yyyy/mm/dd",separator="至"),
      actionButton(inputId="get",label="Get Stock"),
      br(),
      br(),
      checkboxInput(inputId="log",label="Plot y axis on log scale",
                    value=F),
      checkboxInput(inputId="adjust",label="Adjust prices for inflation",
                    value=F)
      ),
    mainPanel(
      plotOutput("plot")
      )
    )
  
  ))
