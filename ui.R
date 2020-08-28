library(shiny)
library(DT)

ui <- fluidPage(
  
  # Application title
  titlePanel("Practising with data sources and processing"),
  fluidRow(
    column(3,           
           selectInput("fleas", label = h3("Filter by flea area"), 
                       choices = list("Unknown" = -1,"Low flea area" = 0, 
                                      "High flea area" = 1,
                                      "All areas" = 2), 
                       selected = 2)),
    column(3,
           selectInput("sex", label = h3("Filter by sex"), 
                       choices = list("Unknown"=-1,"Male" = 0,"Female" = 1, 
                                      "All" = 2), 
                       selected = 2))
  ),
  fluidRow(
    column(6, 
           wellPanel(
             DT::dataTableOutput("table_bartonella"),
             downloadLink(outputId = "download", label = "Download CSV")
           )
    )
  )
)