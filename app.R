#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(devtools)
library(shinydashboard)
library(shiny)
library(V8)
library(shinyjs)
library(rintrojs)
library(highcharter)
library(RColorBrewer)
library(htmlwidgets)
library(dplyr)
library(stringr)
library(magrittr)
library(viridis)
library(viridisLite)
library(readr)
library(tidyr)
library(leaflet)
library(treemap)
library(leaflet.extras)
library(sf)

# ------------------------------- #
# ------------------------------- #
# ------------------------------- #
# ------------SECTION:----------- #
# ----Reference Data & Styles---- #
# ------------------------------- #
# ------------------------------- #
# ------------------------------- #

# IMPORT MAP STYLES
blank <- "https://api.mapbox.com/styles/v1/mrw03b/cjjd6srrl7ot42so3cbjxn6ot/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoibXJ3MDNiIiwiYSI6IlYwb2FiOWcifQ.RWUm2a87fEC9XrDxzvZKKg"
northstar <- "https://api.mapbox.com/styles/v1/mrw03b/cj48wz0xh15td2st5hcmeqmsv/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoibXJ3MDNiIiwiYSI6IlYwb2FiOWcifQ.RWUm2a87fEC9XrDxzvZKKg"
map_attr <- "© <a href='https://www.mapbox.com/map-feedback/'>Mapbox</a> | Map © <a href='http://www.unitedwayaustin.org/our-work/2gen/'>United Way of Greater Austin</a>"

full_zips_list <- "78705|78617|78641|78645|78652|78653|78660|78701|78702|78703|78704|78719|78721|78722|78723|78724|78725|78727|78728|78730|78731|78732|78733|78734|78735|78736|78738|78739|78741|78742|78743|78744|78745|78746|78747|78748|78749|78750|78751|78752|78753|78754|78756|78757|78758|78759|78654|78610|78621|78615|78669|78737|78620|78726"

filter_out <- "78712|78743"

treemap_master <- read_rds('./data/treemap_master.rds') %>%
  ungroup() %>%
  mutate(age = as.character(age))

#TREEMAP DATA - ZIP & NEEDS
needs_zip_treemap <- read_rds('./data/needs_zip_treemap.rds') %>%
  ungroup() %>% 
  janitor::clean_names() %>%
  mutate(day = as.character("01"),
         month = as.character("01")) %>% 
  unite(date, c("year", "month", "day"), sep = "-") %>% 
  mutate(date = as.Date(date, "%Y-%m-%d")) %>% 
  rename(year = date)

travis_dl <- read_rds('./data/data_4_download.rds')

travis <- read_rds('./data/data_4_analysis.rds') %>%
  filter(!str_detect(zipcode, filter_out))  %>% 
  group_by(Year, measure) %>% 
  mutate(rank = dense_rank(desc(value))) %>% 
  ungroup()

travis_summ <- read_rds('./data/summ211.rds')

travis_county_sf <- read_rds('./data/traviscounty_boundary.rds')


# ------------------------------- #
# ------------------------------- #
# ------------SECTION:----------- #
# ----------Dashboard UI--------- #
# ----Header, Siderbar, & Body--- #
# ------------------------------- #
# ------------------------------- #
# ------------------------------- #

jsToggleFS <- 'shinyjs.toggleFullScreen = function() {
    var element = document.documentElement,
enterFS = element.requestFullscreen || element.msRequestFullscreen || element.mozRequestFullScreen || element.webkitRequestFullscreen,
exitFS = document.exitFullscreen || document.msExitFullscreen || document.mozCancelFullScreen || document.webkitExitFullscreen;
if (!document.fullscreenElement && !document.msFullscreenElement && !document.mozFullScreenElement && !document.webkitFullscreenElement) {
enterFS.call(element);
} else {
exitFS.call(document);
}
}'

introjsUI(includeOnly = TRUE, cdn = TRUE)

header <- dashboardHeader(title = tags$a(href='http://www.unitedwayaustin.org',
                                         tags$img(src='uwatxlogo.png', width='80%'),
                                         'City Dashboard')
)


sidebar <- dashboardSidebar(
  useShinyjs(),
  extendShinyjs(text = jsToggleFS),
  sidebarMenu(
    id = "tabs",
    menuItem("The Community", 
             tabName = "community", icon = icon("home")),
    conditionalPanel(
      condition = "input.tabs == 'community'",
      div(id = "BoxYear1",
          sliderInput("year", 
                      "Select a Year:",
                      min = as.Date("2016-01-01"),
                      max = as.Date("2017-01-01"),
                      value= as.Date("2016-01-01"),
                      timeFormat= "%Y",
                      step = 365,
                      animate = animationOptions(interval = 1000))),
      div(id = "BoxIndicator",
          selectInput(
            inputId = "indicator",
            label = "Select an Indicator",
            choices = list(              "211 Call Data" = c("Total 211 Calls" = "total_calls",
                                                             "211 Calls Per 100hh" = "calls_per100HH"),
                                         
                                         "Household Data" = c("Total Households" = "housing_units",
                                                              "Median Household Value" = "housing_median_price",
                                                              "Median Rent" = "estimate_median_gross_rent"),
                                         
                                         "Demographics" = c("Asian Population" = "percent_asian_alone",
                                                            "Black Population" = "percent_black_alone",
                                                            "Hispanic Population" = "percent_hispanic",
                                                            "White Population" = "percent_white_alone"),
                                         
                                         "Poverty & Inequality" = c("Median Family Income" = "median_family_income",
                                                                    "Incomes to Poverty Ratio: 100%" = "percent_below_poverty_level"),
                                         
                                         "Education" = c("Education: Less Than HS" = "percent_less_than_highschool",
                                                         "Education: High School Diploma or GED" = "percent_highschool_GED",
                                                         "Education: Associate's Degree or Some College" = "percent_associates_somecollege",
                                                         "Education: Bachelor's Degree or Higher" = "percent_bachelors_plus"),
                                         
                                         "Health Insurance" = c("Coverage Rate: No Insurance" = "percent_with_no_insurance",
                                                                "Coverage Rate: Insurance" = "percent_with_insurance",
                                                                "Coverage Rate: Private Insurance" = "percent_with_private_insurance",
                                                                "Coverage Rate: Public Insurance" = "percent_with_public_insurance"),
                                         
                                         "Children & the Elderly" = c("Total number of Children Under 6 Years of Age" = "children_under6",
                                                                      "Children Under 6 (%)" = "percent_under6",
                                                                      "Adults Over 60 (%)" = "percent_over60"
                                         )),
            selected = "Calls_per100HH")),
      div(id = "BoxDownload",
          downloadButton('downloadCSV', label = 'Download', style="display: block; margin: 0 auto; width: 200px;color: #152934;")),
      actionButton("help", "Tutorial", icon = icon("book-open", class = "fa-pull-left"), style="color: #152934")
    ),
    hr(style="margin-top: 15px; margin-bottom: 5px; width:90%"),
    menuItem("The Calls",
             tabName = "calls", icon = icon("phone-square")),
    conditionalPanel(
      condition = "input.tabs == 'calls'",
      div(id = "BoxYear2",
          sliderInput("year1", 
                      "Select a Year:",
                      min = as.Date("2016-01-01"),
                      max = as.Date("2017-01-01"),
                      value= as.Date("2016-01-01"),
                      timeFormat= "%Y",
                      step = 365,
                      animate = animationOptions(interval = 1000))),
      div(id = "BoxTier1",
          selectInput("tierone", "Select Primary Tier:",
                      choices = c("Age" = "age",
                                  "Gender" = "gender",
                                  "Language" = "preferred_language",
                                  "Military Branch" = "military_branch",
                                  "Military Status" = "military_status",
                                  "Zip Code" = "zipcode"),
                      selected = "zipcode")),
      div(id = "BoxTier2",
          selectInput("tiertwo", "Select Secondary Tier:",
                      choices = c("Age" = "age",
                                  "Gender" = "gender",
                                  "Language" = "preferred_language",
                                  "Military Branch" = "military_branch",
                                  "Military Status" = "military_status",
                                  "Zip Code" = "zipcode"),
                      selected = "gender"))
      ),
    hr(style="margin-top: 5px; margin-bottom: 5px; width:90%"),
    menuItem("The Index", icon = icon("book"), tabName = "about"),
    hr(style="margin-top: 5px; margin-bottom: 5px; width:90%"),
    HTML("<h4 style='color:#ffffff; padding: 3px 5px 5px 17px; display:block'><i class='fa fa-toolbox'></i> Dashboard Tools</h4>"),
    actionButton("show", "Learn More", icon = icon("info-circle", class = "fa-pull-left"), style="color: #152934"),
    HTML("<button type='button' class='btn btn-default action-button shiny-bound-input' style='display: block; margin: 6px 5px 6px 15px; width: 200px;color: #152934;' onclick = 'shinyjs.toggleFullScreen();'><i class='fa fa-expand fa-pull-left'></i> Fullscreen</button>"),
    hr(style="margin-top: 15px; margin-bottom: 5px; width:90%")
    
  )
)

body <- dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "selectizebootstrap.css"),
    tags$link(rel="stylesheet", href="https://use.fontawesome.com/releases/v5.1.0/css/all.css", integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt", crossorigin="anonymous"),
    tags$script(src = "wordwrap.js"),
    tags$style(".small-box.bg-blue { background-color: #005291 !important; color: #005291 !important; }"),
    tags$style(".small-box.bg-light-blue { background-color: #539ed0 !important; color: #539ed0 !important; }")
  ),
  tabItems(
    tabItem(tabName = "community",
            fluidRow(
              column(width = 6,
                     h1("The 211 Community Explorer"),
                     h5("Click a zip code to start exploring. To find out more, click the tutorial tap in the side bar"),
                     hr(),
                     box(width = 12, height = "630px",
                         h4(textOutput("indicatortext")),
                         div(id = "BoxMap",leafletOutput("map", height = 540))
                     )
              ),
              column(width = 6,
                     div(id = "BoxZipcodeProfile",
                         tabBox(
                           title = textOutput("ziptabtext"),
                           # The id lets us use input$tabset1 on the server to find the current tab
                           id = "tabset1", height = "720px", width = 12,
                           tabPanel("Community Profile",
                                    h3(textOutput("boxplotheader")),
                                    # p(includeMarkdown("tooltips/boxplotexplainer.md")),
                                    highchartOutput("chart1", height = 100),
                                    hr(),
                                    column(width = 6,
                                           h3(textOutput("zipboxprofile"), style = "text-align:left; margin-top:0; margin-bottom:15"),
                                           valueBoxOutput("households", width=12),
                                           valueBoxOutput("mhv", width=12),
                                           valueBoxOutput("callstotal", width=12),
                                           valueBoxOutput("callsperhh", width=12)
                                    ),
                                    column(width = 6, style = "margin-top: 12px;",
                                           selectInput("category", "Select A Profile Category:",
                                                       choices = c("Demographics" = "Race",
                                                                   "Insurance Coverage" = "Insurance",
                                                                   #"Income & Poverty" = "Income & Poverty",
                                                                   "Education" = "Education",
                                                                   "Age" = "Age"),
                                                       selected = "Race"),
                                           # data.hint = "Use this to explore different population topics. For instance, the Demographics category tells us the breakdown of different demographic populations living in a given zip code."
                                           
                                           highchartOutput("zip_profile", height = "350px", width = "90%"))),
                           tabPanel("Breakdown of 211 Calls by Need",
                                    h3(textOutput("treemapheader")),
                                    highchartOutput("treemap", height = 600)
                           )
                         )
                     )
              )
            )
    ),
    
    tabItem(tabName = "calls",
            h1("The 211 Call Explorer"),
            hr(),
            fluidRow(
              div(id = "TreemapBox", style = "padding-left: 10px !important; padding-right:10px !important",
                  box(width = 12, height = "635px",
                      h4("Instructions: Select A Primary & Secondary Tier In The Sidebar To Begin"),
                      hr(),
                      div(id = "Box8",highchartOutput("treemapcallexplore", height = 570), style = "margin-top: -15px;")
                  )
              )
            )
    ),
    tabItem(tabName = "about",
            h1("The Indicator Index"),
            hr(),
            tabBox(
              # title = textOutput("ziptabtext"),
              # The id lets us use input$tabset1 on the server to find the current tab
              id = "tabset2", width = 12,
              tabPanel(title = h3("From The Community Tab"), #This is part of the Index section 
                       fluidRow(
                         div(id = "index1A", style = "padding-left: 10px !important; padding-right:10px !important",
                             box(width = 6,
                                 includeMarkdown("tooltips/callstotal.md"),
                                 title = "Total 211 Calls", 
                                 footer = HTML("<a href='http://www.unitedwayaustin.org/get-help/navigation-center/'>Source: United Way of Greater Austin's 2-1-1 Navigation Center</a>"), 
                                 status = "primary", 
                                 solidHeader = TRUE,
                                 collapsible = TRUE,
                                 collapsed = TRUE
                             ),
                             box(width = 6,
                                 includeMarkdown("tooltips/callshh.md"),
                                 title = "211 Calls Per 100 Households (HHs)", 
                                 footer = HTML("<a href='http://www.unitedwayaustin.org/get-help/navigation-center/'>Source: United Way of Greater Austin's 2-1-1 Navigation Center</a>"), 
                                 status = "primary", 
                                 solidHeader = TRUE,
                                 collapsible = TRUE,
                                 collapsed = TRUE
                             ))),
                       fluidRow(
                         div(id = "index2A", style = "padding-left: 10px !important; padding-right:10px !important",
                             box(
                               includeMarkdown("tooltips/households.md"),
                               title = "Total Households", 
                               footer = HTML("<a href='https://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_17_5YR_DP04&prodType=table'>Source: American Community Survey, 5-Year 'SELECTED HOUSING CHARACTERISTICS '</a>"),
                               status = "primary", 
                               solidHeader = TRUE,
                               collapsible = TRUE,
                               collapsed = TRUE
                             ),
                             box(
                               includeMarkdown("tooltips/mhv.md"),
                               title = "Median Household Value", 
                               footer = HTML("<a href='https://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_17_5YR_DP04&prodType=table'>Source: American Community Survey, 5-Year 'SELECTED HOUSING CHARACTERISTICS '</a>"),
                               status = "primary", 
                               solidHeader = TRUE,
                               collapsible = TRUE,
                               collapsed = TRUE
                             ))),
                       fluidRow(
                         div(id = "index3A", style = "padding-left: 10px !important; padding-right:10px !important",
                             box(
                               includeMarkdown("tooltips/medianrent.md"),
                               title = "Median Rent", 
                               footer = HTML("<a href='https://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_17_5YR_B25064&prodType=table'>Source: American Community Survey, 5-Year 'MEDIAN GROSS RENT (DOLLARS)'</a>"),
                               status = "primary", 
                               solidHeader = TRUE,
                               collapsible = TRUE,
                               collapsed = TRUE
                             ),
                             box(
                               includeMarkdown("tooltips/medianfamincome.md"),
                               title = "Median Family Income", 
                               footer = HTML("<a href='https://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_17_5YR_B19126&prodType=table'>Source: American Community Survey, 5-Year 'MEDIAN FAMILY INCOME'</a>"),
                               status = "primary", 
                               solidHeader = TRUE,
                               collapsible = TRUE,
                               collapsed = TRUE
                             ))),
                       fluidRow(
                         div(id = "index4A", style = "padding-left: 10px !important; padding-right:10px !important",
                             box(
                               includeMarkdown("tooltips/demographics.md"),
                               title = "Demographic Indicators", 
                               footer = HTML("<a href='https://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_17_5YR_DP05&prodType=table'>Source: American Community Survey, 5-Year 'DEMOGRAPHIC AND HOUSING ESTIMATES '</a>"),
                               status = "primary", 
                               solidHeader = TRUE,
                               collapsible = TRUE,
                               collapsed = TRUE
                             ),
                             box(
                               withMathJax(includeMarkdown("tooltips/incomepoverty.md")),
                               title = "Income To Poverty Ratio", 
                               footer = HTML("<a href='https://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_17_5YR_S1701&prodType=table'>Source: American Community Survey, 5-Year 'POVERTY STATUS IN THE PAST 12 MONTHS'</a>"),
                               status = "primary", 
                               solidHeader = TRUE,
                               collapsible = TRUE,
                               collapsed = TRUE
                             ))),
                       fluidRow(
                         div(id = "index5A", style = "padding-left: 10px !important; padding-right:10px !important",
                             box(
                               includeMarkdown("tooltips/insurance.md"),
                               title = "Insurance Coverage", 
                               footer = HTML("<a href='https://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_17_5YR_DP03&prodType=table'>Source: American Community Survey, 5-Year 'SELECTED ECONOMIC CHARACTERISTICS'</a>"),
                               status = "primary", 
                               solidHeader = TRUE,
                               collapsible = TRUE,
                               collapsed = TRUE
                             ),
                             box(
                               includeMarkdown("tooltips/education.md"),
                               title = "Educational Attainment", 
                               footer = HTML("<a href='https://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_17_5YR_B15003&prodType=table'>Source: American Community Survey, 5-Year 'EDUCATIONAL ATTAINMENT FOR THE POPULATION 25 YEARS AND OVER'</a>"),
                               status = "primary", 
                               solidHeader = TRUE,
                               collapsible = TRUE,
                               collapsed = TRUE
                             ))),
                       fluidRow(
                         div(id = "index5A", style = "padding-left: 10px !important; padding-right:10px !important",
                             box(
                               includeMarkdown("tooltips/age2.md"),
                               title = "Children Under 6 Years", 
                               footer = HTML("<a href='https://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_17_5YR_B09001&prodType=table'>Source: American Community Survey, 5-Year 'POPULATION UNDER 18 YEARS BY AGE'</a>"),
                               status = "primary", 
                               solidHeader = TRUE,
                               collapsible = TRUE,
                               collapsed = TRUE
                             ),
                             box(
                               includeMarkdown("tooltips/age2.md"),
                               title = "Adults over 60", 
                               footer = HTML("<a href='https://factfinder.census.gov/faces/tableservices/jsf/pages/productview.xhtml?pid=ACS_17_5YR_S0101&prodType=table'>Source: American Community Survey, 5-Year 'AGE AND SEX '</a>"),
                               status = "primary", 
                               solidHeader = TRUE,
                               collapsible = TRUE,
                               collapsed = TRUE
                             )))),
              tabPanel(title = h3("From The Calls Tab"),
                       fluidRow(
                         div(id = "index1B", style = "padding-left: 10px !important; padding-right:10px !important",
                             box(width = 6,
                                 includeMarkdown("tooltips/age.md"),
                                 title = "Age", 
                                 footer = HTML("<a href='http://www.unitedwayaustin.org/get-help/navigation-center/'>Source: United Way of Greater Austin's 2-1-1 Navigation Center</a>"), 
                                 status = "primary", 
                                 solidHeader = TRUE,
                                 collapsible = TRUE,
                                 collapsed = TRUE
                             ),
                             box(width = 6,
                                 includeMarkdown("tooltips/gender2.md"),
                                 title = "Gender", 
                                 footer = HTML("<a href='http://www.unitedwayaustin.org/get-help/navigation-center/'>Source: United Way of Greater Austin's 2-1-1 Navigation Center</a>"), 
                                 status = "primary", 
                                 solidHeader = TRUE,
                                 collapsible = TRUE,
                                 collapsed = TRUE
                             ))),
                       fluidRow(
                         div(id = "index2B", style = "padding-left: 10px !important; padding-right:10px !important",
                             box(
                               includeMarkdown("tooltips/language.md"),
                               title = "Preferred Language", 
                               footer = HTML("<a href='http://www.unitedwayaustin.org/get-help/navigation-center/'>Source: United Way of Greater Austin's 2-1-1 Navigation Center</a>"), 
                               status = "primary", 
                               solidHeader = TRUE,
                               collapsible = TRUE,
                               collapsed = TRUE
                             ),
                             box(
                               includeMarkdown("tooltips/militarybranch.md"),
                               title = "Military Branch", 
                               footer = HTML("<a href='http://www.unitedwayaustin.org/get-help/navigation-center/'>Source: United Way of Greater Austin's 2-1-1 Navigation Center</a>"), 
                               status = "primary", 
                               solidHeader = TRUE,
                               collapsible = TRUE,
                               collapsed = TRUE
                             ))),
                       fluidRow(
                         div(id = "index3B", style = "padding-left: 10px !important; padding-right:10px !important",
                             box(
                               includeMarkdown("tooltips/militarystatus.md"),
                               title = "Military Status", 
                               footer = HTML("<a href='http://www.unitedwayaustin.org/get-help/navigation-center/'>Source: United Way of Greater Austin's 2-1-1 Navigation Center</a>"), 
                               status = "primary", 
                               solidHeader = TRUE,
                               collapsible = TRUE,
                               collapsed = TRUE
                             ),
                             box(
                               withMathJax(includeMarkdown("tooltips/zipcode.md")),
                               title = "Zip Code", 
                               footer = HTML("<a href='http://www.unitedwayaustin.org/get-help/navigation-center/'>Source: United Way of Greater Austin's 2-1-1 Navigation Center</a>"), 
                               status = "primary", 
                               solidHeader = TRUE,
                               collapsible = TRUE,
                               collapsed = TRUE
                             ))))
            )
    )
  ))

ui <- dashboardPage(introjsUI(),
                    header = header,
                    sidebar = sidebar,
                    body = body
)

# ------------------------------- #
# ------------------------------- #
# ------------------------------- #
# ------------SECTION:----------- #
# --------Dashboard Server------- #
# ------------------------------- #
# ------------------------------- #
# ------------------------------- #

server <- function (input, output, session) {
  
  hintjs(session, options = list("hintButtonLabel"="Close This Hint"))
  
  # start introjs when button is pressed with custom options and events
  observeEvent(input$help,
               introjs(session, options = list(
                 steps = data.frame(element = c("#BoxYear1 .form-group",
                                                "#BoxIndicator .form-group",
                                                "#BoxMap ",
                                                "#BoxZipcodeProfile .nav-tabs-custom",
                                                "#BoxDownload ",
                                                "#shiny-calls-tab li"
                 ),
                 intro = c(includeMarkdown("tooltips/year.md"), #This section is used in the tutorial section 
                           includeMarkdown("tooltips/indicator.md"),
                           includeMarkdown("tooltips/map.md"),
                           includeMarkdown("tooltips/zipcodeprofile.md"),
                           includeMarkdown("tooltips/download.md"),
                           includeMarkdown("tooltips/callstab.md") #This now includes information on the index tab as well. 
                 ),
                 position = c("auto",
                              "auto",
                              "auto",
                              "auto",
                              "auto",
                              "auto"
                 )
                 ),
                 "nextLabel"="Next",
                 "prevLabel"="Previous",
                 "skipLabel"="Exit"),
               )
  )
  
  observeEvent(input$show, {
    showModal(modalDialog(
      title = "About This Dashboard",
      size = "l",
      footer = HTML("<a href='http://www.unitedwayaustin.org/our-work/2gen/'>© United Way of Greater Austin</a>"),
      includeMarkdown("tooltips/abouttext.md"),
      easyClose = TRUE
    ))
  })
  
  data_for_dl <- reactive({
    
    dat <- travis_dl %>%
      filter(Year == input$year) %>% 
      select(Year, zipcode, input$indicator)
    
  })
  
  output$downloadCSV <- downloadHandler(
    filename = 'data.csv', 
    content = function(file) {
      write_csv(data_for_dl(), file)
    }
  )
  
  output$ziptabtext <- renderText({
    
    ziptab_text <-
      travis %>%
      filter(Year == input$year,
             measure == input$indicator,
             zipcode == "78744") %>% 
      mutate(Year = as.character(Year)) %>% 
      mutate(Year = gsub(pattern='-01-01', replacement='', x=Year))
    
    paste0("Zip Code Tools For ", ziptab_text$Year)
  })
  
  output$indicatortext <- renderText({
    travis_indicatortext <-
      travis %>%
      filter(Year == input$year,
             measure == input$indicator,
             zipcode == "78744") %>% 
      mutate(Year = as.character(Year)) %>% 
      mutate(Year = gsub(pattern='-01-01', replacement='', x=Year))
    paste0(travis_indicatortext$Year, " Indicator Trends Map - ", travis_indicatortext$measures) 
  })
  
  output$treemapcallexplore <- renderHighchart({
    
    treemap_explore1 <- treemap_master %>%
      filter(Year == input$year1) %>%
      select(Year, input$tierone, input$tiertwo, need_name, count) %>% 
      group_by(.[[1]],.[[2]],.[[3]],.[[4]]) %>%
      summarize(value = sum(count)) %>%
      filter(`.[[2]]`!="Undetermined" & `.[[3]]`!="Undetermined") %>%
      top_n(20, value) %>% 
      ungroup()
    
    hcoptslang <- getOption("highcharter.lang")
    hcoptslang$thousandsSep <- ","
    options(highcharter.lang = hcoptslang)
    
    hctreemap2(treemap_explore1,
               group_vars = c(".[[2]]",".[[3]]",".[[4]]"),
               size_var = "value",
               color_var = "value",
               animation = FALSE,
               opacity = .4,
               levels = list(
                 list(level = 1, dataLabels = list(enabled = TRUE)),
                 list(level = 2, dataLabels = list(enabled = FALSE)),
                 list(level = 3, dataLabels = list(enabled = FALSE))),
               layoutAlgorithm = "squarified",
               levelIsConstant = FALSE) %>% 
      hc_colorAxis(minColor = brewer.pal(9, "Blues")[1],
                   maxColor = brewer.pal(9, "Blues")[9]) %>%
      hc_tooltip(pointFormat = "<b>{point.name}</b><br>
                 Calls Made: {point.value:,.0f}<br>") %>%
      hc_add_theme(hc_theme(
        chart = list(style = list(fontFamily = "Roboto",
                                  fontSize = "16px")),
        plotOptions = list(
          series = list(
            dataLabels = list(style = list(fontFamily = "Roboto",
                                           fontSize = "1.3em",
                                           textOutline = FALSE)))
        ))) %>%
      hc_legend(align = "left",
                verticalAlign = "top",
                layout = "horizontal") %>% 
      hc_exporting(enabled = TRUE, printMaxWidth = 1300)
  })
  
  output$map <- renderLeaflet({
    
    travis_leaf <-
      travis %>%
      filter(Year == input$year,
             measure == input$indicator)
    
    travis_leaf_wide <- travis_leaf %>%
      filter(Year == input$year,
             measure == input$indicator)
    
    year_text <- 
      travis_summ %>% 
      filter(Year == input$year)  %>% 
      mutate(Year = as.character(Year)) %>% 
      mutate(Year = gsub(pattern='-01-01', replacement='', x=Year))
    
    click_zip <- eventReactive(input$map_shape_click, {
      
      x <- input$map_shape_click
      
      y <- x$id
      
      return(y)
      
    })
    
    observe({
      
      req(click_zip()) # do this if click_tract() is not null
      
      # Add the clicked tract to the map in aqua, and remove when a new one is clicked
      map <- leafletProxy('map') %>%
        removeShape('htract') %>%
        addPolygons(data = travis_leaf[travis_leaf$zipcode == click_zip(), ], fill = FALSE,
                    weight = 4, color = '#2d2d2d', opacity = 1, layerId = 'htract')
      
    })
    
    metro <- reactive({
      
      m <- travis[travis$zipcode == click_zip(), ] 
      m <- m %>% 
        filter(Year == input$year,
               measure == input$indicator) %>% 
        as.data.frame()
      
      return(m)
      
    })
    
    zipcode_data <- reactive({
      
      # Fetch data for the clicked zipcode
      return(metro()[metro()$zipcode == click_zip(), ])
      
    })
    
    metro2 <- reactive({
      
      m <- needs_zip_treemap[needs_zip_treemap$zip_code == click_zip(), ] 
      
      return(m)
      
    })
    
    zipcode_data2 <- reactive({
      
      # Fetch data for the clicked zipcode
      return(metro2()[metro2()$zipcode == click_zip(), ])
      
    })
    
    output$highcharttext <- renderText({
      
      travis_summarytext <- travis %>%
        filter()
      
      paste0("In ", zipcode_data()$zipcode, zipcode_data()$measures, zipcode_data()$zipcode) 
    })
    
    
    output$boxplotheader <- renderText({
      
      m <- travis[travis$zipcode == click_zip(), ] 
      m <- m %>% 
        filter(Year == input$year,
               measure == input$indicator) %>% 
        mutate(Year = as.character(Year)) %>% 
        mutate(Year = gsub(pattern='-01-01', replacement='', x=Year)) %>%  
        as.data.frame()
      
      paste0("Is This Indicator 'Normal' in ", m$zipcode, "?")
      paste0("The dot represents where ", m$zipcode , " lies on the citywide distribution ")
    })
    
    output$zipboxprofile <- renderText({
      
      m <- travis[travis$zipcode == click_zip(), ] 
      m <- m %>% 
        filter(Year == input$year,
               measure == input$indicator) %>% 
        mutate(Year = as.character(Year)) %>% 
        mutate(Year = gsub(pattern='-01-01', replacement='', x=Year)) %>%  
        as.data.frame()
      
      paste0(m$zipcode, " Overview")
    })
    
    output$treemapheader <- renderText({
      
      m <- travis[travis$zipcode == click_zip(), ] 
      m <- m %>% 
        filter(Year == input$year,
               measure == input$indicator) %>% 
        mutate(Year = as.character(Year)) %>% 
        mutate(Year = gsub(pattern='-01-01', replacement='', x=Year)) %>%  
        as.data.frame()
      
      paste0("What does need look like in ", m$zipcode, "?")
    })
    
    output$callstotal <- renderValueBox({
      travis_calls <- travis[travis$zipcode == click_zip(), ] 
      travis_calls <- travis_calls %>% 
        filter(Year == input$year,
               zipcode == travis_calls$zipcode,
               measure == "total_calls") %>% 
        mutate_at(vars(value), scales::comma) %>% 
        mutate(Year = as.character(Year)) %>% 
        mutate(Year = gsub(pattern='-01-01', replacement='', x=Year))
      
      valueBox(
        paste0(travis_calls$value), paste0("Total Calls ",  "(Rank: ", travis_calls$rank,")"), icon = icon("phone"),
        color = "blue"
      )
    })
    
    output$callsperhh <- renderValueBox({
      travis_callshh <- travis[travis$zipcode == click_zip(), ] 
      travis_callshh <- travis_callshh %>% 
        filter(Year == input$year,
               zipcode == travis_callshh$zipcode,
               measure == "calls_per100HH") %>% 
        mutate(Year = as.character(Year)) %>% 
        mutate(Year = gsub(pattern='-01-01', replacement='', x=Year))
      
      valueBox(
        paste0(round(travis_callshh$value, 1)), paste0("Calls Per 100 HHs ", "(Rank: ", travis_callshh$rank,")"), icon = icon("phone-volume"),
        color = "blue"
      )
    })
    
    output$mhv <- renderValueBox({
      travis_mhv <- travis[travis$zipcode == click_zip(), ] 
      travis_mhv <- travis_mhv %>% 
        filter(Year == input$year,
               zipcode == travis_mhv$zipcode,
               measure == "housing_median_price") %>% 
        mutate_at(vars(value), scales::dollar) %>% 
        mutate(Year = as.character(Year)) %>% 
        mutate(Year = gsub(pattern='-01-01', replacement='', x=Year))
      
      valueBox(
        paste0(travis_mhv$value), paste0("Median Household Value ", "(Rank: ", travis_mhv$rank,")"), icon = icon("money-bill-wave"),
        color = "blue"
      )
    })
    
    output$households <- renderValueBox({
      
      travis_hh <- travis[travis$zipcode == click_zip(), ] 
      travis_hh <- travis_hh %>% 
        filter(Year == input$year,
               zipcode == travis_hh$zipcode,
               measure == "housing_units") %>% 
        mutate_at(vars(value), scales::comma) %>% 
        mutate(Year = as.character(Year)) %>% 
        mutate(Year = gsub(pattern='-01-01', replacement='', x=Year))
      
      valueBox(
        paste0(travis_hh$value), paste0("Total Households ", "(Rank: ", travis_hh$rank,")"), icon = icon("home"),
        color = "blue"
      )
    })
    
    output$zip_profile <- renderHighchart({
      
      travis_profile1 <- travis[travis$zipcode == click_zip(), ] 
      travis_profile <- travis_profile1 %>% 
        filter(Year == input$year,
               zipcode == travis_profile1$zipcode,
               category == input$category)
      
      travis_yaxis <- travis_profile1 %>%
        filter(zipcode == travis_profile1$zipcode,
               category == input$category) %>% 
        mutate(min = min(value),
               max = max(value))
      
      hchart(travis_profile, "column", hcaes(x = measures, y = value), animation = FALSE) %>% 
        hc_yAxis(labels = list(format = "{value}%"), 
                 title = FALSE, 
                 min = round(mean(travis_yaxis$min), 1), 
                 max = round(mean(travis_yaxis$max), 1)) %>% 
        hc_xAxis(title = FALSE)  %>%
        hc_plotOptions(
          series = list(
            dataLabels = list(fontFamily = "Roboto",
                              format = "{y}%",
                              enabled = TRUE,
                              borderRadius = 5,
                              backgroundColor = 'rgba(255, 255, 255, 0.8)',
                              borderWidth = 1,
                              borderColor = '#AAA',
                              shape = "callout",
                              y = -6,
                              textOutline = FALSE))) %>% 
        hc_tooltip(enabled = FALSE) %>% 
        hc_add_theme(
          hc_theme_merge(
            hc_theme(
              chart = list(style = list(fontFamily = "Roboto")
              ))))
    })
    
    output$treemap <- renderHighchart({
      
      needs_zip_treemap_int <- needs_zip_treemap[needs_zip_treemap$zip_code == click_zip(), ] %>% 
        filter(year == input$year) #this is the only one where it has to be lower case. 
      
      hctreemap2(needs_zip_treemap_int,
                 group_vars = c("needs_category"),
                 size_var = "value",
                 color_var = "value",
                 animation = FALSE,
                 opacity = .35,
                 levels = list(
                   list(level = 1, dataLabels = list(enabled = TRUE)),
                   list(level = 2, dataLabels = list(enabled = FALSE)),
                   list(level = 3, dataLabels = list(enabled = FALSE))),
                 layoutAlgorithm = "squarified",
                 levelIsConstant = FALSE) %>% 
        hc_colorAxis(minColor = brewer.pal(9, "Blues")[1],
                     maxColor = brewer.pal(9, "Blues")[9]) %>%
        hc_tooltip(pointFormat = "<b>{point.name}</b><br>
                   Calls Made: {point.value:,.0f}<br>") %>%
        hc_add_theme(hc_theme(
          chart = list(
            style = list(
              fontFamily = "Roboto",
              fontSize = "12px")),
          plotOptions = list(
            series = list(
              dataLabels = list(
                style = list(
                  fontFamily = "Roboto",
                  fontSize = "1.2em",
                  textOutline = FALSE)))))) %>% 
        hc_legend(align = "left", 
                  verticalAlign = "bottom",
                  layout = "horizontal") # %>% 
      # hc_exporting(enabled = TRUE)
    })
    
    output$chart1 <- renderHighchart({
      
      m <- travis[travis$zipcode == click_zip(), ] 
      m <- m %>% 
        filter(Year == input$year,
               measure == input$indicator,
               zipcode == m$zipcode)
      
      travis_chart <-
        travis %>%
        mutate(measure = factor(measure),
               value = round(value, 2)) %>% 
        filter(Year == input$year,
               measure == input$indicator) %>% 
        mutate(min = min(value),
               max = max(value))
      
      hcboxplot(x = travis_chart$value, 
                var = travis_chart$measures, animation = FALSE) %>%
        hc_add_series_scatter(x = 0, y =  round(m$value, 2), name = m$zipcode, color = "#539ed0", animation = FALSE) %>%
        hc_yAxis(labels = list(format = "{value}")) %>%
        hc_add_theme(
          hc_theme_merge(
            hc_theme_tufte(),
            hc_theme(chart = list(
             
              style = list(fontFamily = "Roboto")))))
      
    })
    
    pal <- colorNumeric(
      palette = "viridis", n = 10,
      domain = travis_leaf$value)
    
    legend_title <- travis %>% 
      filter(Year == input$year,
             measure == input$indicator,
             zipcode == "78744")
    
    map <- leaflet(travis_leaf) %>%
      addTiles(urlTemplate = "https://api.mapbox.com/styles/v1/mrw03b/ciz5330kn006x2spd1aphokj5/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoibXJ3MDNiIiwiYSI6IlYwb2FiOWcifQ.RWUm2a87fEC9XrDxzvZKKg", 
               options = providerTileOptions(detectRetina = TRUE), 
               attribution = map_attr) %>%
      addPolygons(data=travis_county_sf,
                  stroke = .1,
                  smoothFactor = 0,
                  fill = F,
                  color = "gray") %>%
      addPolygons(data = travis_leaf,
                  stroke = FALSE, 
                  smoothFactor = 0, 
                  fillColor = ~pal(value),
                  # popup = popupmaker,
                  fillOpacity = 0.8, 
                  layerId = ~zipcode) %>%
      addFullscreenControl(position = "topright", pseudoFullscreen = FALSE) %>% 
      setView(lat = 30.3357, lng = -97.7259, zoom = 10) %>%
      addResetMapButton() %>% 
      addLegend("bottomleft",
                pal = pal,
                values = ~value,
                labFormat = labelFormat(
                  prefix = " ", suffix = "", between = ", "
                ),
                title = paste0(legend_title$measures),
                opacity = 1)
    
    map
    
  })
  
}

shiny::shinyApp(ui, server)

