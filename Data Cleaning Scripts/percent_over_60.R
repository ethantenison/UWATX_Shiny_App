
#percent over 60 years of age 

#percent of Children under 5 by zipcode 

        library(tidyverse)
        library(dplyr)

        
 #2016
        over60_2016<- read.csv("./ACS_Data/ACS_16_5YR_S0101_with_ann.csv")
        over60_2016 <- select(over60_2016, GEO.id2, HC02_EST_VC31)
        over60_2016 <- rename(over60_2016, zipcode = GEO.id2, percent_over60 = HC02_EST_VC31)
        over60_2016 <- over60_2016[2:1942,]
        over60_2016 <- mutate(over60_2016, zipcode = as.numeric(as.character(zipcode)), 
                              percent_over60 = as.numeric(as.character(percent_over60)))
        over60_2016 <- filter(over60_2016, zipcode %in% c( 78617,78641,78645,78652,78653,78660,78701,78702
                                                           ,78703,78704,78719,78721,78722,78723,78724,78725
                                                           ,78727,78728,78730,78731,78732,78733,78734,78735
                                                           ,78736,78738,78739,78741,78742,78743,78744,78745
                                                           ,78746,78747,78748,78749,78750,78751,78752,78753
                                                           ,78754,78756,78757,78758,78759,78654,78610,78621
                                                           ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT 
        year2016 <- ymd(20160101)
        over60_2016 <- mutate(over60_2016, date = year2016)
        
#2017
        over60_2017<- read.csv("./ACS_Data/ACS_17_5YR_S0101_with_ann.csv")
        over60_2017 <- select(over60_2017, GEO.id2, HC02_EST_VC31)
        over60_2017 <- rename(over60_2017, zipcode = GEO.id2, percent_over60 = HC02_EST_VC31)
        over60_2017 <- over60_2017[2:1942,]
        over60_2017 <- mutate(over60_2017, zipcode = as.numeric(as.character(zipcode)), 
                              percent_over60 = as.numeric(as.character(percent_over60)))
        over60_2017 <- filter(over60_2017, zipcode %in% c( 78617,78641,78645,78652,78653,78660,78701,78702
                                                           ,78703,78704,78719,78721,78722,78723,78724,78725
                                                           ,78727,78728,78730,78731,78732,78733,78734,78735
                                                           ,78736,78738,78739,78741,78742,78743,78744,78745
                                                           ,78746,78747,78748,78749,78750,78751,78752,78753
                                                           ,78754,78756,78757,78758,78759,78654,78610,78621
                                                           ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT 
        year2017 <- ymd(20170101)
        over60_2017 <- mutate(over60_2017, date = year2017)
        
#Binding the rows to create one dataset for over 60 years old  
        over60 <- bind_rows(over60_2016, over60_2017)
        over60$percent_over60 <- paste0(over60$percent_over60, '%')
        
#Save R object 
saveRDS(over60, file = "./R Objects/over60.RDS")
        
