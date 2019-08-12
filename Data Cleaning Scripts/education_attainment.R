#education attainment by zipcode 

library(tidyverse)
library(dplyr)
library(janitor)
library(scales) #to convert to percent 
library(lubridate)



#2016
education_2016<- read.csv("./ACS_Data/ACS_16_5YR_B15003_with_ann.csv")
education_2016 <- select(education_2016, GEO.id2, starts_with("HD01"))
names(education_2016) <- as.matrix(education_2016[1, ])
education_2016 <- education_2016[-1, ]
education_2016 <- clean_names(education_2016)
education_2016 <- rename(education_2016, zipcode = id2)
education_2016 <- education_2016 %>% mutate_each(funs(as.character))
education_2016 <- education_2016 %>% mutate_each(funs(as.numeric))
education_2016 <- filter(education_2016, zipcode %in% c( 78705,78617,78641,78645,78652,78653,78660,78701,78702
                                                         ,78703,78704,78719,78721,78722,78723,78724,78725
                                                         ,78727,78728,78730,78731,78732,78733,78734,78735
                                                         ,78736,78738,78739,78741,78742,78743,78744,78745
                                                         ,78746,78747,78748,78749,78750,78751,78752,78753
                                                         ,78754,78756,78757,78758,78759,78654,78610,78621
                                                         ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT 

education_2016 <- mutate(education_2016, less_than_highschool = rowSums(education_2016[,3:17]),
                         high_school_GED = estimate_total_regular_high_school_diploma + estimate_total_ged_or_alternative_credential
                         ,associates_some_college = estimate_total_some_college_1_or_more_years_no_degree +
                           estimate_total_some_college_less_than_1_year + estimate_total_associates_degree , bachelors_plus = 
                           estimate_total_bachelors_degree + estimate_total_masters_degree + estimate_total_professional_school_degree +
                           estimate_total_doctorate_degree)
education_2016 <- education_2016[,-(3:26)]

#setting the date 
year2016 <- ymd(20160101)
education_2016 <- mutate(education_2016, date = year2016) 

#2017
education_2017<- read.csv("./ACS_Data/ACS_17_5YR_B15003_with_ann.csv")
education_2017 <- select(education_2017, GEO.id2, starts_with("HD01"))
names(education_2017) <- as.matrix(education_2017[1, ])
education_2017 <- education_2017[-1, ]
education_2017 <- clean_names(education_2017)
education_2017 <- rename(education_2017, zipcode = id2)
education_2017 <- education_2017 %>% mutate_each(funs(as.character))
education_2017 <- education_2017 %>% mutate_each(funs(as.numeric))
education_2017 <- filter(education_2017, zipcode %in% c( 78705,78617,78641,78645,78652,78653,78660,78701,78702
                                                         ,78703,78704,78719,78721,78722,78723,78724,78725
                                                         ,78727,78728,78730,78731,78732,78733,78734,78735
                                                         ,78736,78738,78739,78741,78742,78743,78744,78745
                                                         ,78746,78747,78748,78749,78750,78751,78752,78753
                                                         ,78754,78756,78757,78758,78759,78654,78610,78621
                                                         ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT 

education_2017 <- mutate(education_2017, less_than_highschool = rowSums(education_2017[,3:17]),
                         high_school_GED = estimate_total_regular_high_school_diploma + estimate_total_ged_or_alternative_credential
                         ,associates_some_college = estimate_total_some_college_1_or_more_years_no_degree +
                           estimate_total_some_college_less_than_1_year + estimate_total_associates_degree , bachelors_plus = 
                           estimate_total_bachelors_degree + estimate_total_masters_degree + estimate_total_professional_school_degree +
                           estimate_total_doctorate_degree)
education_2017 <- education_2017[,-(3:26)]

#setting the date 
year2017 <- ymd(20170101)
education_2017 <- mutate(education_2017, date = year2017)  

#Binding the rows to create one dataset for educational_attainment 
education <- bind_rows(education_2016, education_2017)

#Transform the values to percents
education <- transmute(education,date, zipcode, estimate_total, percent_less_than_highschool = less_than_highschool/estimate_total,
                       percent_highschool_GED = high_school_GED/estimate_total, percent_associates_somecollege = 
                       associates_some_college/estimate_total, percent_bachelors_plus = bachelors_plus/estimate_total)

education$percent_less_than_highschool <- percent(education$percent_less_than_highschool)
education$percent_highschool_GED <- percent(education$percent_highschool_GED)
education$percent_associates_somecollege <- percent(education$percent_associates_somecollege)
education$percent_bachelors_plus <- percent(education$percent_bachelors_plus)
education <- select(education, -(estimate_total))

#save R object 
saveRDS(education, file = "./R Objects/education_attainment.RDS")
