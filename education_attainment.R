#education attainment by zipcode 

library(tidyverse)
library(dplyr)

#2013pulling the csv file into the global environment
education_2013<- read.csv("./ACS_Data/ACS_13_5YR_B15003_with_ann.csv")

#2013selecting meaningful columns
education_2013 <- select(education_2013, GEO.id2, starts_with("HD01"))


#2013renaming column headers and filtering for Travis country zipcodes
names(education_2013) <- as.matrix(education_2013[1, ])
education_2013 <- education_2013[-1, ]
colnames(education_2013) <- gsub("Estimate; Total: - ", "e", colnames(education_2013))
colnames(education_2013) <- gsub(" ", "_", colnames(education_2013))
education_2013 <- rename(education_2013, zipcode = Id2)
education_2013 <- education_2013 %>% mutate_each(funs(as.character))
education_2013 <- education_2013 %>% mutate_each(funs(as.numeric))
education_2013 <- filter(education_2013, zipcode %in% c( 78641,78641, 78645, 78645, 78645, 78645 ,  
                                                         78651,78652,78653, 78660, 78669, 78669, 78691,78701, 78702,78703, 78704, 78705, 78708, 78709 ,78710, 78711
                                                         ,78713,78714,78715,78716,78718,78719,78720,78721,78722,78723,78724,78725,78726,78727,78728,78730,78731,
                                                         78732, 78733,78733, 78733, 78734,78734,78734,78734,78735, 78735,78736, 78617)) #78712 is excluded,represents UT 
education_2013 <- rename(education_2013, e12th_grade  = "e12th_grade,_no_diploma")
#Combining information to create one value for less than high school and college 
education_2013 <- mutate(education_2013, less_than_highschool = eNo_schooling_completed + eNursery_school + 
                           eKindergarten + e1st_grade+ e2nd_grade + e3rd_grade + e4th_grade + e5th_grade + e6th_grade 
                         + e7th_grade + e8th_grade + e9th_grade + e10th_grade +e11th_grade + e12th_grade)


#2013Adding a column for year 
education_2013 <- mutate(education_2013, year = 2013) 
