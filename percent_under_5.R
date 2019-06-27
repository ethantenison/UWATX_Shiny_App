#percent of Children under 5 by zipcode 

library(tidyverse)
library(dplyr)

#2013pulling the csv file into the global environment
        under5_2013<- read.csv("./ACS_Data/ACS_13_5YR_S0101_with_ann.csv")

#2013selecting meaningful columns
        under5_2013 <- select(under5_2013, GEO.id2, HC02_EST_VC03)

#2013renaming column headers and filtering for Travis country zipcodes
        under5_2013 <- rename(under5_2013, zipcode = GEO.id2, percent_under5 = HC02_EST_VC03)
        under5_2013 <- under5_2013[2:1942,]
        under5_2013 <- mutate(under5_2013, zipcode = as.numeric(as.character(zipcode)), 
                percent_under5 = as.numeric(as.character(percent_under5)))
        under5_2013 <- filter(under5_2013, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
        
#2013Adding a column for year 
        under5_2013 <- mutate(under5_2013, year = 2013)
                                               

#2014
        under5_2014<- read.csv("./ACS_Data/ACS_14_5YR_S0101_with_ann.csv")
        under5_2014 <- select(under5_2014, GEO.id2, HC02_EST_VC03)
        under5_2014 <- rename(under5_2014, zipcode = GEO.id2, percent_under5 = HC02_EST_VC03)
        under5_2014 <- under5_2014[2:1942,]
        under5_2014 <- mutate(under5_2014, zipcode = as.numeric(as.character(zipcode)), 
                              percent_under5 = as.numeric(as.character(percent_under5)))
        under5_2014 <- filter(under5_2014, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                           78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                           ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                           78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
        under5_2014 <- mutate(under5_2014, year = 2014)
        
#2015
        under5_2015<- read.csv("./ACS_Data/ACS_15_5YR_S0101_with_ann.csv")
        under5_2015 <- select(under5_2015, GEO.id2, HC02_EST_VC03)
        under5_2015 <- rename(under5_2015, zipcode = GEO.id2, percent_under5 = HC02_EST_VC03)
        under5_2015 <- under5_2015[2:1942,]
        under5_2015 <- mutate(under5_2015, zipcode = as.numeric(as.character(zipcode)), 
                              percent_under5 = as.numeric(as.character(percent_under5)))
        under5_2015 <- filter(under5_2015, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                           78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                           ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                           78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
        under5_2015 <- mutate(under5_2015, year = 2015)
        
#2016
        under5_2016<- read.csv("./ACS_Data/ACS_16_5YR_S0101_with_ann.csv")
        under5_2016 <- select(under5_2016, GEO.id2, HC02_EST_VC03)
        under5_2016 <- rename(under5_2016, zipcode = GEO.id2, percent_under5 = HC02_EST_VC03)
        under5_2016 <- under5_2016[2:1942,]
        under5_2016 <- mutate(under5_2016, zipcode = as.numeric(as.character(zipcode)), 
                              percent_under5 = as.numeric(as.character(percent_under5)))
        under5_2016 <- filter(under5_2016, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                           78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                           ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                           78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
        under5_2016 <- mutate(under5_2016, year = 2016)
        
#2017
        under5_2017<- read.csv("./ACS_Data/ACS_17_5YR_S0101_with_ann.csv")
        under5_2017 <- select(under5_2017, GEO.id2, HC02_EST_VC03)
        under5_2017 <- rename(under5_2017, zipcode = GEO.id2, percent_under5 = HC02_EST_VC03)
        under5_2017 <- under5_2017[2:1942,]
        under5_2017 <- mutate(under5_2017, zipcode = as.numeric(as.character(zipcode)), 
                              percent_under5 = as.numeric(as.character(percent_under5)))
        under5_2017 <- filter(under5_2017, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                           78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                           ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                           78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
        under5_2017 <- mutate(under5_2017, year = 2017)
        
#Binding the rows to create one dataset for poverty status 
        under5 <- bind_rows(under5_2013, under5_2014, under5_2015, under5_2016, under5_2017)
        