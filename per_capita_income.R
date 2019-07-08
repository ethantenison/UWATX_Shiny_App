#percapita income 
library(tidyverse)
library(dplyr)
library(janitor)
#2013pulling the csv file into the global environment
perCapita_Income_2013<- read.csv("./ACS_Data/ACS_13_5YR_B19301_with_ann.csv")


#2013renaming column headers and filtering for Travis country zipcodes
names(perCapita_Income_2013) <- as.matrix(perCapita_Income_2013[1, ])
perCapita_Income_2013 <- perCapita_Income_2013[-1, ]
perCapita_Income_2013 <- clean_names(perCapita_Income_2013)
perCapita_Income_2013 <- rename(perCapita_Income_2013, zipcode = id2)
perCapita_Income_2013 <- perCapita_Income_2013 %>% mutate_each(funs(as.character))
perCapita_Income_2013 <- perCapita_Income_2013 %>% mutate_each(funs(as.numeric))
perCapita_Income_2013 <- filter(perCapita_Income_2013, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                       78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                       78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                       78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                       78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

#2013selecting meaningful columns
perCapita_Income_2013 <- select(perCapita_Income_2013, zipcode, contains("estimate"),
                                -(contains("margin")), -(geography), -(id))
perCapita_Income_2013 <- perCapita_Income_2013[,1:3]
perCapita_Income_2013 <- rename(perCapita_Income_2013, median_household_income = households_estimate_total, 
                                median_family_income = families_estimate_total)


#2013Adding a column for year 
perCapita_Income_2013 <- mutate(perCapita_Income_2013, year = 2013)  

#2014


perCapita_Income_2014<- read.csv("./ACS_Data/ACS_14_5YR_B19301_with_ann.csv")
names(perCapita_Income_2014) <- as.matrix(perCapita_Income_2014[1, ])
perCapita_Income_2014 <- perCapita_Income_2014[-1, ]
perCapita_Income_2014 <- clean_names(perCapita_Income_2014)
perCapita_Income_2014 <- rename(perCapita_Income_2014, zipcode = id2)
perCapita_Income_2014 <- perCapita_Income_2014 %>% mutate_each(funs(as.character))
perCapita_Income_2014 <- perCapita_Income_2014 %>% mutate_each(funs(as.numeric))
perCapita_Income_2014 <- filter(perCapita_Income_2014, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                       78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                       78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                       78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                       78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT


perCapita_Income_2014 <- select(perCapita_Income_2014, zipcode, contains("estimate"),
                                -(contains("margin")), -(geography), -(id))
perCapita_Income_2014 <- perCapita_Income_2014[,1:3]
perCapita_Income_2014 <- rename(perCapita_Income_2014, median_household_income = households_estimate_total, 
                                median_family_income = families_estimate_total)

perCapita_Income_2014 <- mutate(perCapita_Income_2014, year = 2014)   

#2015

perCapita_Income_2015<- read.csv("./ACS_Data/ACS_15_5YR_B19301_with_ann.csv")
names(perCapita_Income_2015) <- as.matrix(perCapita_Income_2015[1, ])
perCapita_Income_2015 <- perCapita_Income_2015[-1, ]
perCapita_Income_2015 <- clean_names(perCapita_Income_2015)
perCapita_Income_2015 <- rename(perCapita_Income_2015, zipcode = id2)
perCapita_Income_2015 <- perCapita_Income_2015 %>% mutate_each(funs(as.character))
perCapita_Income_2015 <- perCapita_Income_2015 %>% mutate_each(funs(as.numeric))
perCapita_Income_2015 <- filter(perCapita_Income_2015, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                       78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                       78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                       78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                       78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

perCapita_Income_2015 <- select(perCapita_Income_2015, zipcode, contains("estimate"),
                                -(contains("margin")), -(geography), -(id))
perCapita_Income_2015 <- perCapita_Income_2015[,1:3]
perCapita_Income_2015 <- rename(perCapita_Income_2015, median_household_income = households_estimate_total, 
                                median_family_income = families_estimate_total)

perCapita_Income_2015 <- mutate(perCapita_Income_2015, year = 2015)   

#2016

perCapita_Income_2016<- read.csv("./ACS_Data/ACS_16_5YR_B19301_with_ann.csv")
names(perCapita_Income_2016) <- as.matrix(perCapita_Income_2016[1, ])
perCapita_Income_2016 <- perCapita_Income_2016[-1, ]
perCapita_Income_2016 <- clean_names(perCapita_Income_2016)
perCapita_Income_2016 <- rename(perCapita_Income_2016, zipcode = id2)
perCapita_Income_2016 <- perCapita_Income_2016 %>% mutate_each(funs(as.character))
perCapita_Income_2016 <- perCapita_Income_2016 %>% mutate_each(funs(as.numeric))
perCapita_Income_2016 <- filter(perCapita_Income_2016, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                       78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                       78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                       78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                       78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT

perCapita_Income_2016 <- select(perCapita_Income_2016, zipcode, contains("estimate"),
                                -(contains("margin")), -(geography), -(id))
perCapita_Income_2016 <- perCapita_Income_2016[,1:3]
perCapita_Income_2016 <- rename(perCapita_Income_2016, median_household_income = households_estimate_total, 
                                median_family_income = families_estimate_total)

perCapita_Income_2016 <- mutate(perCapita_Income_2016, year = 2016) 

#2017

perCapita_Income_2017<- read.csv("./ACS_Data/ACS_17_5YR_B19301_with_ann.csv")
names(perCapita_Income_2017) <- as.matrix(perCapita_Income_2017[1, ])
perCapita_Income_2017 <- perCapita_Income_2017[-1, ]
perCapita_Income_2017 <- clean_names(perCapita_Income_2017)
perCapita_Income_2017 <- rename(perCapita_Income_2017, zipcode = id2)
perCapita_Income_2017 <- perCapita_Income_2017 %>% mutate_each(funs(as.character))
perCapita_Income_2017 <- perCapita_Income_2017 %>% mutate_each(funs(as.numeric))
perCapita_Income_2017 <- filter(perCapita_Income_2017, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                       78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                       78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                       78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                       78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

perCapita_Income_2017 <- select(perCapita_Income_2017, zipcode, contains("estimate"),
                                -(contains("margin")), -(geography), -(id))
perCapita_Income_2017 <- perCapita_Income_2017[,1:3]
perCapita_Income_2017 <- rename(perCapita_Income_2017, median_household_income = households_estimate_total, 
                                median_family_income = families_estimate_total)

perCapita_Income_2017 <- mutate(perCapita_Income_2017, year = 2017)


#binding rows
perCapita_Income <- bind_rows(perCapita_Income_2013, perCapita_Income_2014, perCapita_Income_2015, perCapita_Income_2016, perCapita_Income_2017)
