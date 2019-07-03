#percent of Children under 6 by zipcode 

library(tidyverse)
library(dplyr)
library(janitor)
#2013pulling the csv file into the global environment
under6_2013<- read.csv("./ACS_Data/ACS_13_5YR_B17020_with_ann.csv") #dis wrong though =( )


#2013renaming column headers and filtering for Travis country zipcodes
names(under6_2013) <- as.matrix(under6_2013[1, ])
under6_2013 <- under6_2013[-1, ]
under6_2013 <- clean_names(under6_2013)
under6_2013 <- rename(under6_2013, zipcode = id2)
under6_2013 <- under6_2013 %>% mutate_each(funs(as.character))
under6_2013 <- under6_2013 %>% mutate_each(funs(as.numeric))
under6_2013 <- filter(under6_2013, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                   78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                   ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                   78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 

#2013selecting meaningful columns
under6_2013 <- select(under6_2013, zipcode, estimate_total, estimate_income_in_the_past_12_months_below_poverty_level,
                      estimate_income_in_the_past_12_months_below_poverty_level_under_6_years)
                      
under6_2013 <- under6_2013[,-2]
names(under6_2013) <- c("zipcode", "percent_with_under6", "percent_with_private_under6", 
                        "percent_with_public_under6", "percent_with_no_under6")

#2013Adding a column for year 
under6_2013 <- mutate(under6_2013, year = 2013)  
