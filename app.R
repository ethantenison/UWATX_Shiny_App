# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
library(dplyr)
library(shiny)
library(leaflet)
library(leaflet.extras)
library(readr)

# ------------------------------- #
# ------------------------------- #
# ------------------------------- #
# ------------SECTION:----------- #
# ----Reference Data & Styles---- #
# ------------------------------- #
# ------------------------------- #
# ------------------------------- #
df <- read_rds("./R Objects/combined_data_wide.RDS")



# ------------------------------- #
# ------------------------------- #
# ------------SECTION:----------- #
# ----------Dashboard UI--------- #
# ----Header, Siderbar, & Body--- #
# ------------------------------- #
# ------------------------------- #
# ------------------------------- #
ui <- fluidPage(
  print("Hello World!"),
  
  #Sets the output of the ui 
  leafletOutput("mymap", height = 1000)
)


# ------------------------------- #
# ------------------------------- #
# ------------------------------- #
# ------------SECTION:----------- #
# --------Dashboard Server------- #
# ------------------------------- #
# ------------------------------- #
# ------------------------------- #
server <- function(input,output, session){
  
  #pull in the data and set it to be reactive 
  data <- reactive({
    x <- df
  })
  
  #takes the output of the ui and uses as an input in the server 
  output$mymap <- renderLeaflet({
    df <- data()
    
    m <- leaflet(data = df) %>%
      addTiles() %>%
      setView(lng=-97.7430608, lat= 30.267153 , zoom=10)
    m
  })
}


# ------------------------------- #
# ------------------------------- #
# ------------------------------- #
# ------------SECTION:----------- #
# --------Shiny function--------- #
# ------------------------------- #
# ------------------------------- #
# ------------------------------- #

shinyApp(ui = ui, server = server)
