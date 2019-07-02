#education attainment by zipcode 

library(tidyverse)
library(dplyr)
library(janitor)

#2013pulling the csv file into the global environment
education_2013<- read.csv("./ACS_Data/ACS_13_5YR_B15003_with_ann.csv")

#2013selecting meaningful columns
education_2013 <- select(education_2013, GEO.id2, starts_with("HD01"))


#2013renaming column headers and filtering for Travis country zipcodes
names(education_2013) <- as.matrix(education_2013[1, ])
education_2013 <- education_2013[-1, ]
education_2013 <- clean_names(education_2013)
education_2013 <- rename(education_2013, zipcode = id2)
education_2013 <- education_2013 %>% mutate_each(funs(as.character))
education_2013 <- education_2013 %>% mutate_each(funs(as.numeric))
education_2013 <- filter(education_2013, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                         78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                         ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                         78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 

#Combining information to create one value for less than high school and college 
education_2013 <- mutate(education_2013, less_than_highschool = rowSums(education_2013[,3:17]))
                         
                         

#2013Adding a column for year 
education_2013 <- mutate(education_2013, year = 2013) 

#2014 
education_2014<- read.csv("./ACS_Data/ACS_14_5YR_B15003_with_ann.csv")
education_2014 <- select(education_2014, GEO.id2, starts_with("HD01"))
names(education_2014) <- as.matrix(education_2014[1, ])
education_2014 <- education_2014[-1, ]
education_2014 <- clean_names(education_2014)
education_2014 <- rename(education_2014, zipcode = id2)
education_2014 <- education_2014 %>% mutate_each(funs(as.character))
education_2014 <- education_2014 %>% mutate_each(funs(as.numeric))
education_2014 <- filter(education_2014, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
           78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
           ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
           78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
education_2014 <- mutate(education_2014, less_than_highschool = rowSums(education_2014[,3:17]))
education_2014 <- mutate(education_2014, year = 2014) 

#2015
education_2015<- read.csv("./ACS_Data/ACS_15_5YR_B15003_with_ann.csv")
education_2015 <- select(education_2015, GEO.id2, starts_with("HD01"))
names(education_2015) <- as.matrix(education_2015[1, ])
education_2015 <- education_2015[-1, ]
education_2015 <- clean_names(education_2015)
education_2015 <- rename(education_2015, zipcode = id2)
education_2015 <- education_2015 %>% mutate_each(funs(as.character))
education_2015 <- education_2015 %>% mutate_each(funs(as.numeric))
education_2015 <- filter(education_2015, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                         78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                         ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                         78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
education_2015 <- mutate(education_2015, less_than_highschool = rowSums(education_2015[,3:17]))
education_2015 <- mutate(education_2015, year = 2015)  

#2016
education_2016<- read.csv("./ACS_Data/ACS_16_5YR_B15003_with_ann.csv")
education_2016 <- select(education_2016, GEO.id2, starts_with("HD01"))
names(education_2016) <- as.matrix(education_2016[1, ])
education_2016 <- education_2016[-1, ]
education_2016 <- clean_names(education_2016)
education_2016 <- rename(education_2016, zipcode = id2)
education_2016 <- education_2016 %>% mutate_each(funs(as.character))
education_2016 <- education_2016 %>% mutate_each(funs(as.numeric))
education_2016 <- filter(education_2016, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                         78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                         ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                         78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
education_2016 <- mutate(education_2016, less_than_highschool = rowSums(education_2016[,3:17]))
education_2016 <- mutate(education_2016, year = 2016)  

#2017
education_2017<- read.csv("./ACS_Data/ACS_17_5YR_B15003_with_ann.csv")
education_2017 <- select(education_2017, GEO.id2, starts_with("HD01"))
names(education_2017) <- as.matrix(education_2017[1, ])
education_2017 <- education_2017[-1, ]
education_2017 <- clean_names(education_2017)
education_2017 <- rename(education_2017, zipcode = id2)
education_2017 <- education_2017 %>% mutate_each(funs(as.character))
education_2017 <- education_2017 %>% mutate_each(funs(as.numeric))
education_2017 <- filter(education_2017, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                         78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                         ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                         78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
education_2017 <- mutate(education_2017, less_than_highschool = rowSums(education_2017[,3:17]))
education_2017 <- mutate(education_2017, year = 2017)  

#Binding the rows to create one dataset for educational_attainment 
education <- bind_rows(education_2013, education_2014, education_2015, education_2016, education_2017)
education <- select(education, zipcode, less_than_highschool, estimate_total_regular_high_school_diploma, estimate_total_bachelors_degree, year)