#median income 
library(tidyverse)
library(dplyr)
library(janitor)
#2013pulling the csv file into the global environment
medianIncome_2013<- read.csv("./ACS_Data/ACS_13_5YR_S1901_with_ann.csv")


#2013renaming column headers and filtering for Travis country zipcodes
names(medianIncome_2013) <- as.matrix(medianIncome_2013[1, ])
medianIncome_2013 <- medianIncome_2013[-1, ]
medianIncome_2013 <- clean_names(medianIncome_2013)
medianIncome_2013 <- rename(medianIncome_2013, zipcode = id2)
medianIncome_2013 <- medianIncome_2013 %>% mutate_each(funs(as.character))
medianIncome_2013 <- medianIncome_2013 %>% mutate_each(funs(as.numeric))
medianIncome_2013 <- filter(medianIncome_2013, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

#2013selecting meaningful columns
medianIncome_2013 <- select(medianIncome_2013, zipcode, contains("estimate"),
                            -(contains("margin")), -(geography), -(id))
medianIncome_2013 <- medianIncome_2013[,1:3]
medianIncome_2013 <- rename(medianIncome_2013, median_household_income = households_estimate_total, 
                            median_family_income = families_estimate_total)


#2013Adding a column for year 
medianIncome_2013 <- mutate(medianIncome_2013, year = 2013)  

#2014


medianIncome_2014<- read.csv("./ACS_Data/ACS_14_5YR_S1901_with_ann.csv")
names(medianIncome_2014) <- as.matrix(medianIncome_2014[1, ])
medianIncome_2014 <- medianIncome_2014[-1, ]
medianIncome_2014 <- clean_names(medianIncome_2014)
medianIncome_2014 <- rename(medianIncome_2014, zipcode = id2)
medianIncome_2014 <- medianIncome_2014 %>% mutate_each(funs(as.character))
medianIncome_2014 <- medianIncome_2014 %>% mutate_each(funs(as.numeric))
medianIncome_2014 <- filter(medianIncome_2014, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT


medianIncome_2014 <- select(medianIncome_2014, zipcode, contains("estimate"),
                            -(contains("margin")), -(geography), -(id))
medianIncome_2014 <- medianIncome_2014[,1:3]
medianIncome_2014 <- rename(medianIncome_2014, median_household_income = households_estimate_total, 
                            median_family_income = families_estimate_total)

medianIncome_2014 <- mutate(medianIncome_2014, year = 2014)   

#2015

medianIncome_2015<- read.csv("./ACS_Data/ACS_15_5YR_S1901_with_ann.csv")
names(medianIncome_2015) <- as.matrix(medianIncome_2015[1, ])
medianIncome_2015 <- medianIncome_2015[-1, ]
medianIncome_2015 <- clean_names(medianIncome_2015)
medianIncome_2015 <- rename(medianIncome_2015, zipcode = id2)
medianIncome_2015 <- medianIncome_2015 %>% mutate_each(funs(as.character))
medianIncome_2015 <- medianIncome_2015 %>% mutate_each(funs(as.numeric))
medianIncome_2015 <- filter(medianIncome_2015, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

medianIncome_2015 <- select(medianIncome_2015, zipcode, contains("estimate"),
                            -(contains("margin")), -(geography), -(id))
medianIncome_2015 <- medianIncome_2015[,1:3]
medianIncome_2015 <- rename(medianIncome_2015, median_household_income = households_estimate_total, 
                            median_family_income = families_estimate_total)

medianIncome_2015 <- mutate(medianIncome_2015, year = 2015)   

#2016

medianIncome_2016<- read.csv("./ACS_Data/ACS_16_5YR_S1901_with_ann.csv")
names(medianIncome_2016) <- as.matrix(medianIncome_2016[1, ])
medianIncome_2016 <- medianIncome_2016[-1, ]
medianIncome_2016 <- clean_names(medianIncome_2016)
medianIncome_2016 <- rename(medianIncome_2016, zipcode = id2)
medianIncome_2016 <- medianIncome_2016 %>% mutate_each(funs(as.character))
medianIncome_2016 <- medianIncome_2016 %>% mutate_each(funs(as.numeric))
medianIncome_2016 <- filter(medianIncome_2016, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT

medianIncome_2016 <- select(medianIncome_2016, zipcode, contains("estimate"),
                            -(contains("margin")), -(geography), -(id))
medianIncome_2016 <- medianIncome_2016[,1:3]
medianIncome_2016 <- rename(medianIncome_2016, median_household_income = households_estimate_total, 
                            median_family_income = families_estimate_total)

medianIncome_2016 <- mutate(medianIncome_2016, year = 2016) 

#2017

medianIncome_2017<- read.csv("./ACS_Data/ACS_17_5YR_S1901_with_ann.csv")
names(medianIncome_2017) <- as.matrix(medianIncome_2017[1, ])
medianIncome_2017 <- medianIncome_2017[-1, ]
medianIncome_2017 <- clean_names(medianIncome_2017)
medianIncome_2017 <- rename(medianIncome_2017, zipcode = id2)
medianIncome_2017 <- medianIncome_2017 %>% mutate_each(funs(as.character))
medianIncome_2017 <- medianIncome_2017 %>% mutate_each(funs(as.numeric))
medianIncome_2017 <- filter(medianIncome_2017, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

medianIncome_2017 <- select(medianIncome_2017, zipcode, contains("estimate"),
                            -(contains("margin")), -(geography), -(id))
medianIncome_2017 <- medianIncome_2017[,1:3]
medianIncome_2017 <- rename(medianIncome_2017, median_household_income = households_estimate_total, 
                            median_family_income = families_estimate_total)

medianIncome_2017 <- mutate(medianIncome_2017, year = 2017)


#binding rows
medianIncome <- bind_rows(medianIncome_2013, medianIncome_2014, medianIncome_2015, medianIncome_2016, medianIncome_2017)
