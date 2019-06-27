
#percent over 60 years of age 

#percent of Children under 5 by zipcode 

        library(tidyverse)
        library(dplyr)
        
#2013pulling the csv file into the global environment
        over60_2013<- read.csv("./ACS_Data/ACS_13_5YR_S0101_with_ann.csv")
        
#2013selecting meaningful columns
        over60_2013 <- select(over60_2013, GEO.id2, HC02_EST_VC31)
        
#2013renaming column headers and filtering for Travis country zipcodes
        over60_2013 <- rename(over60_2013, zipcode = GEO.id2, percent_over60 = HC02_EST_VC31)
        over60_2013 <- over60_2013[2:1942,]
        over60_2013 <- mutate(over60_2013, zipcode = as.numeric(as.character(zipcode)), 
                              percent_over60 = as.numeric(as.character(percent_over60)))
        over60_2013 <- filter(over60_2013, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                           78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                           ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                           78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
        
#2013Adding a column for year 
        over60_2013 <- mutate(over60_2013, year = 2013)
        
        
#2014
        over60_2014<- read.csv("./ACS_Data/ACS_14_5YR_S0101_with_ann.csv")
        over60_2014 <- select(over60_2014, GEO.id2, HC02_EST_VC31)
        over60_2014 <- rename(over60_2014, zipcode = GEO.id2, percent_over60 = HC02_EST_VC31)
        over60_2014 <- over60_2014[2:1942,]
        over60_2014 <- mutate(over60_2014, zipcode = as.numeric(as.character(zipcode)), 
                              percent_over60 = as.numeric(as.character(percent_over60)))
        over60_2014 <- filter(over60_2014, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                           78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                           ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                           78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
        over60_2014 <- mutate(over60_2014, year = 2014)
        
 #2015
        over60_2015<- read.csv("./ACS_Data/ACS_15_5YR_S0101_with_ann.csv")
        over60_2015 <- select(over60_2015, GEO.id2, HC02_EST_VC31)
        over60_2015 <- rename(over60_2015, zipcode = GEO.id2, percent_over60 = HC02_EST_VC31)
        over60_2015 <- over60_2015[2:1942,]
        over60_2015 <- mutate(over60_2015, zipcode = as.numeric(as.character(zipcode)), 
                              percent_over60 = as.numeric(as.character(percent_over60)))
        over60_2015 <- filter(over60_2015, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                           78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                           ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                           78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
        over60_2015 <- mutate(over60_2015, year = 2015)
        
 #2016
        over60_2016<- read.csv("./ACS_Data/ACS_16_5YR_S0101_with_ann.csv")
        over60_2016 <- select(over60_2016, GEO.id2, HC02_EST_VC31)
        over60_2016 <- rename(over60_2016, zipcode = GEO.id2, percent_over60 = HC02_EST_VC31)
        over60_2016 <- over60_2016[2:1942,]
        over60_2016 <- mutate(over60_2016, zipcode = as.numeric(as.character(zipcode)), 
                              percent_over60 = as.numeric(as.character(percent_over60)))
        over60_2016 <- filter(over60_2016, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                           78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                           ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                           78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
        over60_2016 <- mutate(over60_2016, year = 2016)
        
#2017
        over60_2017<- read.csv("./ACS_Data/ACS_17_5YR_S0101_with_ann.csv")
        over60_2017 <- select(over60_2017, GEO.id2, HC02_EST_VC31)
        over60_2017 <- rename(over60_2017, zipcode = GEO.id2, percent_over60 = HC02_EST_VC31)
        over60_2017 <- over60_2017[2:1942,]
        over60_2017 <- mutate(over60_2017, zipcode = as.numeric(as.character(zipcode)), 
                              percent_over60 = as.numeric(as.character(percent_over60)))
        over60_2017 <- filter(over60_2017, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                           78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                           ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                           78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
        over60_2017 <- mutate(over60_2017, year = 2017)
        
#Binding the rows to create one dataset for over 60 years old  
        over60 <- bind_rows(over60_2013, over60_2014, over60_2015, over60_2016, over60_2017)
        
