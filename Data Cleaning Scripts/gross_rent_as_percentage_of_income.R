#Gross Rent as percentage of household income  

library(tidyverse)
library(dplyr)

#2013pulling the csv file into the global environment
grossrent_percentage_2013<- read.csv("./ACS_Data/ACS_13_5YR_B25070_with_ann.csv")

#2013selecting meaningful columns
grossrent_percentage_2013 <- select(grossrent_percentage_2013, GEO.id2, HD01_VD02
                                    , HD01_VD03, HD01_VD04, HD01_VD05, HD01_VD06, HD01_VD07, HD01_VD08, HD01_VD09, HD01_VD10)

#2013renaming column headers and filtering for Travis country zipcodes
names(grossrent_percentage_2013) <- c("zipcode", "less_than_10.0_percent",  "p_10.0_to_14.9", "p_15.0_to_19.9", 
                                      "p_20.0_to_24.9", "p_25.0_to_29.9", "p_30.0_to_34.9",  
                                      "p_35.0_to_39.9","p_40.0_to_49.9",  "p_50.0_percent_or_more")
grossrent_percentage_2013 <- grossrent_percentage_2013[2:1942,]
grossrent_percentage_2013 <- grossrent_percentage_2013 <- mutate_each(grossrent_percentage_2013, funs(as.character))
grossrent_percentage_2013 <- grossrent_percentage_2013<- mutate_each(grossrent_percentage_2013, funs(as.numeric))

grossrent_percentage_2013 <- filter(grossrent_percentage_2013, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                       78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                       ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                       78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 

grossrent_percentage_2013 <-  mutate(grossrent_percentage_2013, total = less_than_10.0_percent + p_10.0_to_14.9 +
                                       p_15.0_to_19.9 + p_20.0_to_24.9 + p_25.0_to_29.9 + p_30.0_to_34.9 + p_35.0_to_39.9 
                                     + p_40.0_to_49.9 + p_50.0_percent_or_more)

grossrent_percentage_2013 <- grossrent_percentage_2013<- mutate_each(grossrent_percentage_2013, funs(./total)) #stopped right here 

grossrent_percentage_2013 <-  mutate(grossrent_percentage_2013, multiply_percentage =  5*less_than_10.0_percent + 
                                       12.45*p_10.0_to_14.9 + 17.45*p_15.0_to_19.9 + 22.45*p_20.0_to_24.9 + 
                                       27.45*p_25.0_to_29.9 + 32.45*p_30.0_to_34.9 + 37.45*p_35.0_to_39.9 + 
                                       44.95*p_40.0_to_49.9 + 55*p_50.0_percent_or_more, median_percentage = 
                                       multiply_percentage / 9)


#2013Adding a column for year 
grossrent_percentage_2013 <- mutate(grossrent_percentage_2013, year = 2013)
