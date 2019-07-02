#No health insurnace
library(tidyverse)
library(dplyr)
library(janitor)
#2013pulling the csv file into the global environment
insurance_2013<- read.csv("./ACS_Data/ACS_13_5YR_DP03_with_ann.csv")





#2013renaming column headers and filtering for Travis country zipcodes
names(insurance_2013) <- as.matrix(insurance_2013[1, ])
insurance_2013 <- insurance_2013[-1, ]
insurance_2013 <- clean_names(insurance_2013)
insurance_2013 <- rename(insurance_2013, zipcode = id2)
insurance_2013 <- insurance_2013 %>% mutate_each(funs(as.character))
insurance_2013 <- insurance_2013 %>% mutate_each(funs(as.numeric))
insurance_2013 <- filter(insurance_2013, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                         78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                         ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                         78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 

#2013selecting meaningful columns
insurance_2013 <- select(insurance_2013, zipcode, contains("health_insurance_coverage"), -(contains("margin")), -(contains("years")), -(contains("estimate")))

#Combining information to create one value for less than high school and college 
insurance_2013 <- mutate(insurance_2013, less_than_highschool = rowSums(insurance_2013[,3:17]))



#2013Adding a column for year 
insurance_2013 <- mutate(insurance_2013, year = 2013)  
