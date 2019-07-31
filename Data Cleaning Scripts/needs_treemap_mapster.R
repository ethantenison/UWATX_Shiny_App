#treemap master document with more details about calls 
library(xlsx)
library(dplyr)
library(janitor)
library(readr)
library(openxlsx)
library(lubridate)

#2016
icarol_2016 <- openxlsx::read.xlsx("./211 Data/2016 CNT iCarol Export.xlsx", 
                                   sheet = 1, startRow = 1, colNames = TRUE)

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
icarol_2016 <- select(icarol_2016, age, zip_code, gender, preferred_language, need_name)

