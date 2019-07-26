
#Housing Units 

library(tidyverse)
library(dplyr)
library(lubridate)



#2016
housing_units_2016<- read.csv("./ACS_Data/ACS_16_5YR_DP04_with_ann.csv")
housing_units_2016 <- select(housing_units_2016, GEO.id2, HC01_VC03)
housing_units_2016 <- rename(housing_units_2016, zipcode = GEO.id2, housing_units = HC01_VC03)
housing_units_2016 <- housing_units_2016[2:1942,]
housing_units_2016 <- mutate(housing_units_2016, zipcode = as.numeric(as.character(zipcode)), 
                             housing_units = as.numeric(as.character(housing_units)))
housing_units_2016 <- filter(housing_units_2016, zipcode %in% c( 78617,78641,78645,78652,78653,78660,78701,78702
                                                                 ,78703,78704,78719,78721,78722,78723,78724,78725
                                                                 ,78727,78728,78730,78731,78732,78733,78734,78735
                                                                 ,78736,78738,78739,78741,78742,78743,78744,78745
                                                                 ,78746,78747,78748,78749,78750,78751,78752,78753
                                                                 ,78754,78756,78757,78758,78759,78654,78610,78621
                                                                 ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT
#setting the date 
year2016 <- ymd(20160101)
housing_units_2016 <- mutate(housing_units_2016, date = year2016)  

#2017
housing_units_2017<- read.csv("./ACS_Data/ACS_17_5YR_DP04_with_ann.csv")
housing_units_2017 <- select(housing_units_2017, GEO.id2, HC01_VC03)
housing_units_2017 <- rename(housing_units_2017, zipcode = GEO.id2, housing_units = HC01_VC03)
housing_units_2017 <- housing_units_2017[2:1942,]
housing_units_2017 <- mutate(housing_units_2017, zipcode = as.numeric(as.character(zipcode)), 
                             housing_units = as.numeric(as.character(housing_units)))
housing_units_2017 <- filter(housing_units_2017, zipcode %in% c( 78617,78641,78645,78652,78653,78660,78701,78702
                                                                 ,78703,78704,78719,78721,78722,78723,78724,78725
                                                                 ,78727,78728,78730,78731,78732,78733,78734,78735
                                                                 ,78736,78738,78739,78741,78742,78743,78744,78745
                                                                 ,78746,78747,78748,78749,78750,78751,78752,78753
                                                                 ,78754,78756,78757,78758,78759,78654,78610,78621
                                                                 ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT 
#setting the date 
year2017 <- ymd(20170101)
housing_units_2017 <- mutate(housing_units_2017, date = year2017)  

#Binding the rows to create one dataset  
housing_units <- bind_rows(housing_units_2016, housing_units_2017)

#save R object file 
saveRDS(housing_units, file = "./R Objects/total_housing_units.RDS")