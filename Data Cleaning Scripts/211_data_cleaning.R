#211 Data files (Clean those mothers!)
library(xlsx)
library(dplyr)
library(janitor)
library(readr)
library(openxlsx)
library(lubridate)

#2016 pulling the csv file into the global environment. NOTE the original file was an excel file, but I saved as and converted it into
#a csv file, which is much easier to work with. 

icarol_2016 <- openxlsx::read.xlsx("./211 Data/2016 CNT iCarol Export.xlsx", sheet = 1, startRow = 1, colNames = TRUE)

#2016renaming column headers and filtering for Travis country zipcodes
icarol_2016 <- clean_names(icarol_2016)

icarol_2016 <- filter(icarol_2016, zip_code
                          %in% c(78617,78641,78645,78652,78653,78660,78701,78702
                                 ,78703,78704,78719,78721,78722,78723,78724,78725
                                 ,78727,78728,78730,78731,78732,78733,78734,78735
                                 ,78736,78738,78739,78741,78742,78743,78744,78745
                                 ,78746,78747,78748,78749,78750,78751,78752,78753
                                 ,78754,78756,78757,78758,78759,78654,78610,78621
                                 ,78615,78669,78737,78620,78726)) 

icarol_2016 <- filter(icarol_2016, call_type != "Transfer")
icarol_2016 <- filter(icarol_2016, call_type != "Disconnect")
date2016 <- ymd(20160101)
icarol_2016 <- mutate(icarol_2016, date = date2016)


#2016Computing the total number of calls per zipcode along with per 100 households 
calls2016 <- distinct(icarol_2016, call_report_number, .keep_all =  TRUE)
calls2016 <- calls2016 %>% group_by(zip_code) %>% summarise(total_calls = n())
calls2016 <- mutate(calls2016, year = 2016)
total_housing_units <- read_rds("./R Objects/total_housing_units.RDS")
calls2016 <- left_join(calls2016, total_housing_units, by = c("zip_code" = "zipcode", "year"))
calls2016 <- mutate(calls2016, calls_per100HH = total_calls / (housing_units/100) )



calls2016 <- transmute(calls2016, zip_code = unique(calls2016$zip_code), total_calls =   )
dfunique2016 <- unique(two_one_one2016$call_report_number)
total_calls2016 <- length(dfunique2016)