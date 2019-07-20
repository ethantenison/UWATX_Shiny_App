#median income 
library(tidyverse)
library(dplyr)
library(janitor)
#2013pulling the csv file into the global environment
median_income_family_2013<- read.csv("./ACS_Data/ACS_13_5YR_B19126_with_ann.csv")

#you may have to come back and fix the year 2015 

#2013renaming column headers and filtering for Travis country zipcodes
names(median_income_family_2013) <- as.matrix(median_income_family_2013[1, ])
median_income_family_2013 <- median_income_family_2013[-1, ]
median_income_family_2013 <- clean_names(median_income_family_2013)
median_income_family_2013 <- rename(median_income_family_2013, zipcode = id2)
median_income_family_2013 <- median_income_family_2013 %>% mutate_each(funs(as.character))
median_income_family_2013 <- median_income_family_2013 %>% mutate_each(funs(as.numeric))
median_income_family_2013 <- filter(median_income_family_2013, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

#2013selecting meaningful columns
median_income_family_2013 <- select(median_income_family_2013, zipcode, 
                                    estimate_median_family_income_in_the_past_12_months_in_2013_inflation_adjusted_dollars_total)

median_income_family_2013 <- rename(median_income_family_2013, median_family_income =  
                                      estimate_median_family_income_in_the_past_12_months_in_2013_inflation_adjusted_dollars_total)

#2013Adding a column for year 
median_income_family_2013 <- mutate(median_income_family_2013, year = 2013)  

#2014
median_income_family_2014<- read.csv("./ACS_Data/ACS_14_5YR_B19126_with_ann.csv")
names(median_income_family_2014) <- as.matrix(median_income_family_2014[1, ])
median_income_family_2014 <- median_income_family_2014[-1, ]
median_income_family_2014 <- clean_names(median_income_family_2014)
median_income_family_2014 <- rename(median_income_family_2014, zipcode = id2)
median_income_family_2014 <- median_income_family_2014 %>% mutate_each(funs(as.character))
median_income_family_2014 <- median_income_family_2014 %>% mutate_each(funs(as.numeric))
median_income_family_2014 <- filter(median_income_family_2014, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT


median_income_family_2014 <- select(median_income_family_2014, zipcode, 
                                    estimate_median_family_income_in_the_past_12_months_in_2014_inflation_adjusted_dollars_total)

median_income_family_2014 <- rename(median_income_family_2014, median_family_income =  
                                      estimate_median_family_income_in_the_past_12_months_in_2014_inflation_adjusted_dollars_total)


median_income_family_2014 <- mutate(median_income_family_2014, year = 2014)   

#2015

median_income_family_2015<- read.csv("./ACS_Data/ACS_15_5YR_B19126_with_ann.csv")
names(median_income_family_2015) <- as.matrix(median_income_family_2015[1, ])
median_income_family_2015 <- median_income_family_2015[-1, ]
median_income_family_2015 <- clean_names(median_income_family_2015)
median_income_family_2015 <- rename(median_income_family_2015, zipcode = id2)
median_income_family_2015 <- median_income_family_2015 %>% mutate_each(funs(as.character))
median_income_family_2015 <- median_income_family_2015 %>% mutate_each(funs(as.numeric))
median_income_family_2015 <- filter(median_income_family_2015, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

median_income_family_2015 <- select(median_income_family_2015, zipcode, 
                                    estimate_median_family_income_in_the_past_12_months_in_2015_inflation_adjusted_dollars_total)

median_income_family_2015 <- rename(median_income_family_2015, median_family_income =  
                                      estimate_median_family_income_in_the_past_12_months_in_2015_inflation_adjusted_dollars_total)

median_income_family_2015 <- mutate(median_income_family_2015, year = 2015)   

#2016

median_income_family_2016<- read.csv("./ACS_Data/ACS_16_5YR_B19126_with_ann.csv")
names(median_income_family_2016) <- as.matrix(median_income_family_2016[1, ])
median_income_family_2016 <- median_income_family_2016[-1, ]
median_income_family_2016 <- clean_names(median_income_family_2016)
median_income_family_2016 <- rename(median_income_family_2016, zipcode = id2)
median_income_family_2016 <- median_income_family_2016 %>% mutate_each(funs(as.character))
median_income_family_2016 <- median_income_family_2016 %>% mutate_each(funs(as.numeric))
median_income_family_2016 <- filter(median_income_family_2016, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT


median_income_family_2016 <- select(median_income_family_2016, zipcode, 
                                    estimate_median_family_income_in_the_past_12_months_in_2016_inflation_adjusted_dollars_total)

median_income_family_2016 <- rename(median_income_family_2016, median_family_income =  
                                      estimate_median_family_income_in_the_past_12_months_in_2016_inflation_adjusted_dollars_total)

median_income_family_2016 <- mutate(median_income_family_2016, year = 2016) 

#2017

median_income_family_2017<- read.csv("./ACS_Data/ACS_17_5YR_B19126_with_ann.csv")
names(median_income_family_2017) <- as.matrix(median_income_family_2017[1, ])
median_income_family_2017 <- median_income_family_2017[-1, ]
median_income_family_2017 <- clean_names(median_income_family_2017)
median_income_family_2017 <- rename(median_income_family_2017, zipcode = id2)
median_income_family_2017 <- median_income_family_2017 %>% mutate_each(funs(as.character))
median_income_family_2017 <- median_income_family_2017 %>% mutate_each(funs(as.numeric))
median_income_family_2017 <- filter(median_income_family_2017, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

median_income_family_2017 <- select(median_income_family_2017, zipcode, 
                                    estimate_median_family_income_in_the_past_12_months_in_2017_inflation_adjusted_dollars_total)

median_income_family_2017 <- rename(median_income_family_2017, median_family_income =  
                                      estimate_median_family_income_in_the_past_12_months_in_2017_inflation_adjusted_dollars_total)


median_income_family_2017 <- mutate(median_income_family_2017, year = 2017)


#binding rows
median_income_family <- bind_rows(median_income_family_2013, median_income_family_2014, median_income_family_2015, median_income_family_2016, median_income_family_2017)
