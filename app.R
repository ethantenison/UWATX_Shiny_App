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
library(sf)

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
  sliderInput(inputId = "MedianIncome", "Median Income", 0, 180000, value = 50000),
  leafletOutput(outputId = "mymap")
)
# ------------------------------- #
# ------------------------------- #
# ------------------------------- #
# ------------SECTION:----------- #
# --------Dashboard Server------- #
# ------------------------------- #
# ------------------------------- #
# ------------------------------- #
server <- function(input,output){
  output$mymap <- renderLeaflet({ 
    leaflet(data_polygon) %>% addProviderTiles(providers$OpenStreetMap.BlackAndWhite) %>% addPolygons(data = data_polygon[data_polygon@data$median_family_income < input$MedianIncome, ])})
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
