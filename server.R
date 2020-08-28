library(DT)
library(readr)
library(dplyr)
library(gapminder)

server <- function(input, output) {
  setwd("/cloud/project/")
  
  # modify your rds_data here, as above #
  # rds_data <- filter(gapminder,year>1980 & continent == "Asia") #
  bartonellanew <- reactive({
    
    if (input$fleas<2) {
      bartonella<-(filter(bartonella,Fleas==input$fleas))
    } else{
      bartonella
    }
    if (input$sex<2){
      bartonella<-(filter(bartonella,Sex==input$sex))
    } else {
      bartonella
    }
  })
  
  output$table_bartonella <- DT::renderDataTable({
    datatable(bartonellanew(),
              options = list(scrollX = TRUE)
    )
  })
  
  #  output$table_gapminder <- DT::renderDataTable({
  #    datatable(gapminder,
  #              options = list(scrollX = TRUE)
  #    )
  #  })
  
  # Download Handler
  output$download <- downloadHandler(
    filename <-function() {
      return("output_data.csv")
    },
    content = function(file) {
      write.csv(bartonella, file)
    }
  )
}