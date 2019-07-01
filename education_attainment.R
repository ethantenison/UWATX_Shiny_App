#education attainment by zipcode 

library(tidyverse)
library(dplyr)

#2013pulling the csv file into the global environment
education_2013<- read.csv("./ACS_Data/ACS_13_5YR_B15003_with_ann")

#2013selecting meaningful columns
education_2013 <- select(education_2013, GEO.id2, HC02_EST_VC03)

#2013renaming column headers and filtering for Travis country zipcodes
education_2013 <- rename(education_2013, zipcode = GEO.id2, percent_education = HC02_EST_VC03)
education_2013 <- education_2013[2:1942,]
education_2013 <- mutate(education_2013, zipcode = as.numeric(as.character(zipcode)), 
                         percent_education = as.numeric(as.character(percent_education)))
education_2013 <- filter(education_2013, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                         78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                         ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                         78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 

#2013Adding a column for year 
education_2013 <- mutate(education_2013, year = 2013) 
