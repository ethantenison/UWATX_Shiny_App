#percent of Children under 6 by zipcode 

library(tidyverse)
library(dplyr)

#2013pulling the csv file into the global environment
        under6_2013<- read.csv("./ACS_Data/ACS_13_5YR_S0901_with_ann.csv")

#2013selecting meaningful columns
        under6_2013 <- select(under6_2013, GEO.id2, HC01_EST_VC03)

#2017renaming column headers and filtering for Travis country zipcodes
        under6_2013 <- rename(under6_2013, zipcode = GEO.id2, percent_under6 = HC01_EST_VC03)
        under6_2013 <- under6_2013[2:361,]
        under6_2013 <- mutate(under6_2013, zipcode = as.numeric(as.character(zipcode)), 
                percent_under6 = as.numeric(as.character(percent_under6)))
        under6_2013 <- filter(under6_2013, zipcode %in% c(78617, 78641,78641, 78645, 78645, 78645, 78645 ,  
                78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736)) #78712 is excluded, it represents UT 

