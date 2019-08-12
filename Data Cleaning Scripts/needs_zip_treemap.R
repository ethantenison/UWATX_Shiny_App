#Treemap 
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
                      %in% c(78705,78617,78641,78645,78652,78653,78660,78701,78702
                             ,78703,78704,78719,78721,78722,78723,78724,78725
                             ,78727,78728,78730,78731,78732,78733,78734,78735
                             ,78736,78738,78739,78741,78742,78743,78744,78745
                             ,78746,78747,78748,78749,78750,78751,78752,78753
                             ,78754,78756,78757,78758,78759,78654,78610,78621
                             ,78615,78669,78737,78620,78726)) 

icarol_2016 <- filter(icarol_2016, call_type != "Transfer")
icarol_2016 <- filter(icarol_2016, call_type != "Disconnect")

#group by need name 

needs_zip_treemap16 <- icarol_2016 %>% group_by(zip_code, need_name) %>% tally()

#reformat data 

needs_zip_treemap16 <- rename(needs_zip_treemap16, zipcode = zip_code, value = n)
needs_zip_treemap16 <- mutate(needs_zip_treemap16, Year = 2016)


#2017
icarol_2017 <- openxlsx::read.xlsx("./211 Data/2017 iCarol Export 1.3.18.xlsx", sheet = 2, startRow = 1, colNames = TRUE)

icarol_2017 <- clean_names(icarol_2017)

icarol_2017 <- filter(icarol_2017, zip_code
                      %in% c(78705,78617,78641,78645,78652,78653,78660,78701,78702
                             ,78703,78704,78719,78721,78722,78723,78724,78725
                             ,78727,78728,78730,78731,78732,78733,78734,78735
                             ,78736,78738,78739,78741,78742,78743,78744,78745
                             ,78746,78747,78748,78749,78750,78751,78752,78753
                             ,78754,78756,78757,78758,78759,78654,78610,78621
                             ,78615,78669,78737,78620,78726)) 

icarol_2017 <- filter(icarol_2017, call_type != "Transfer")
icarol_2017 <- filter(icarol_2017, call_type != "Disconnect")

needs_zip_treemap17 <- icarol_2017 %>% group_by(zip_code, need_name) %>% tally()
needs_zip_treemap17 <- rename(needs_zip_treemap17, zipcode = zip_code, value = n)
needs_zip_treemap17 <- mutate(needs_zip_treemap17, Year = 2017)


#create one object and saving
needs_zip_treemap <- bind_rows(needs_zip_treemap16, needs_zip_treemap17)
needs_zip_treemap <- na.omit(needs_zip_treemap)
needs_zip_treemap <- filter(needs_zip_treemap, value >5)
needs_zip_treemap$Year <- as.character(needs_zip_treemap$Year)
needs_zip_treemap$value <- as.numeric(needs_zip_treemap$value)


needs_zip_treemap <- rename(needs_zip_treemap, "Zip Code" = zipcode, "Value" = value, 
                            "Needs Category" = need_name)




saveRDS(needs_zip_treemap, file = "./R Objects/needs_zip_treemap.RDS")

