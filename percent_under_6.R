#percent of Children under 6 by zipcode 

library(tidyverse)
library(dplyr)
library(janitor)
library(scales)
#2013pulling the csv file into the global environment
under6_2013<- read.csv("./ACS_Data/ACS_13_5YR_B09001_with_ann.csv") 
total_pop_2013 <- read.csv("./ACS_Data/ACS_13_5YR_B01003_with_ann.csv") 


#2013renaming column headers and filtering for Travis country zipcodes
names(under6_2013) <- as.matrix(under6_2013[1, ])
under6_2013 <- under6_2013[-1, ]
under6_2013 <- clean_names(under6_2013)
under6_2013 <- rename(under6_2013, zipcode = id2)
under6_2013 <- under6_2013 %>% mutate_each(funs(as.character))
under6_2013 <- under6_2013 %>% mutate_each(funs(as.numeric))
under6_2013 <- filter(under6_2013, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                   78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                   78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                   78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                   78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 
names(total_pop_2013) <- as.matrix(total_pop_2013[1, ])
total_pop_2013 <- total_pop_2013[-1, ]
total_pop_2013 <- clean_names(total_pop_2013)
total_pop_2013 <- rename(total_pop_2013, zipcode = id2)
total_pop_2013 <- total_pop_2013 %>% mutate_each(funs(as.character))
total_pop_2013 <- total_pop_2013 %>% mutate_each(funs(as.numeric))
total_pop_2013 <- filter(total_pop_2013, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                         78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                         78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                         78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                         78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT



#2013selecting meaningful columns
under6_2013 <- select(under6_2013, zipcode, estimate_total, estimate_in_households_under_3_years, 
                      estimate_in_households_3_and_4_years, estimate_in_households_5_years)
under6_2013 <- mutate(under6_2013, children_under6 = estimate_in_households_under_3_years + estimate_in_households_3_and_4_years
                      +estimate_in_households_5_years )
total_pop_2013 <- total_pop_2013 %>% select(zipcode, estimate_total) %>% rename(pop_total = estimate_total) 

under6_2013 <- left_join(under6_2013, total_pop_2013, by = "zipcode")
under6_2013 <- mutate(under6_2013, percent_under6 = children_under6/ pop_total, year = 2013)
under6_2013 <- select(under6_2013, zipcode, children_under6, percent_under6, year)
                      

#2014 
under6_2014<- read.csv("./ACS_Data/ACS_14_5YR_B09001_with_ann.csv") 
total_pop_2014 <- read.csv("./ACS_Data/ACS_14_5YR_B01003_with_ann.csv") 

names(under6_2014) <- as.matrix(under6_2014[1, ])
under6_2014 <- under6_2014[-1, ]
under6_2014 <- clean_names(under6_2014)
under6_2014 <- rename(under6_2014, zipcode = id2)
under6_2014 <- under6_2014 %>% mutate_each(funs(as.character))
under6_2014 <- under6_2014 %>% mutate_each(funs(as.numeric))
under6_2014 <- filter(under6_2014, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                   78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                   78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                   78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                   78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 
names(total_pop_2014) <- as.matrix(total_pop_2014[1, ])
total_pop_2014 <- total_pop_2014[-1, ]
total_pop_2014 <- clean_names(total_pop_2014)
total_pop_2014 <- rename(total_pop_2014, zipcode = id2)
total_pop_2014 <- total_pop_2014 %>% mutate_each(funs(as.character))
total_pop_2014 <- total_pop_2014 %>% mutate_each(funs(as.numeric))
total_pop_2014 <- filter(total_pop_2014, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                         78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                         78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                         78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                         78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT

under6_2014 <- select(under6_2014, zipcode, estimate_total, estimate_in_households_under_3_years, 
                      estimate_in_households_3_and_4_years, estimate_in_households_5_years)
under6_2014 <- mutate(under6_2014, children_under6 = estimate_in_households_under_3_years + estimate_in_households_3_and_4_years
                      +estimate_in_households_5_years )
total_pop_2014 <- total_pop_2014 %>% select(zipcode, estimate_total) %>% rename(pop_total = estimate_total) 

under6_2014 <- left_join(under6_2014, total_pop_2014, by = "zipcode")
under6_2014 <- mutate(under6_2014, percent_under6 = children_under6/ pop_total, year = 2014)
under6_2014 <- select(under6_2014, zipcode, children_under6, percent_under6, year)

#2015
under6_2015<- read.csv("./ACS_Data/ACS_15_5YR_B09001_with_ann.csv") 
total_pop_2015 <- read.csv("./ACS_Data/ACS_15_5YR_B01003_with_ann.csv") 

names(under6_2015) <- as.matrix(under6_2015[1, ])
under6_2015 <- under6_2015[-1, ]
under6_2015 <- clean_names(under6_2015)
under6_2015 <- rename(under6_2015, zipcode = id2)
under6_2015 <- under6_2015 %>% mutate_each(funs(as.character))
under6_2015 <- under6_2015 %>% mutate_each(funs(as.numeric))
under6_2015 <- filter(under6_2015, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                   78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                   78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                   78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                   78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 
names(total_pop_2015) <- as.matrix(total_pop_2015[1, ])
total_pop_2015 <- total_pop_2015[-1, ]
total_pop_2015 <- clean_names(total_pop_2015)
total_pop_2015 <- rename(total_pop_2015, zipcode = id2)
total_pop_2015 <- total_pop_2015 %>% mutate_each(funs(as.character))
total_pop_2015 <- total_pop_2015 %>% mutate_each(funs(as.numeric))
total_pop_2015 <- filter(total_pop_2015, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                         78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                         78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                         78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                         78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT

under6_2015 <- select(under6_2015, zipcode, estimate_total, estimate_in_households_under_3_years, 
                      estimate_in_households_3_and_4_years, estimate_in_households_5_years)
under6_2015 <- mutate(under6_2015, children_under6 = estimate_in_households_under_3_years + estimate_in_households_3_and_4_years
                      +estimate_in_households_5_years )
total_pop_2015 <- total_pop_2015 %>% select(zipcode, estimate_total) %>% rename(pop_total = estimate_total) 

under6_2015 <- left_join(under6_2015, total_pop_2015, by = "zipcode")
under6_2015 <- mutate(under6_2015, percent_under6 = children_under6/ pop_total, year = 2015)
under6_2015 <- select(under6_2015, zipcode, children_under6, percent_under6, year)

#2016
under6_2016<- read.csv("./ACS_Data/ACS_16_5YR_B09001_with_ann.csv") 
total_pop_2016 <- read.csv("./ACS_Data/ACS_16_5YR_B01003_with_ann.csv") 

names(under6_2016) <- as.matrix(under6_2016[1, ])
under6_2016 <- under6_2016[-1, ]
under6_2016 <- clean_names(under6_2016)
under6_2016 <- rename(under6_2016, zipcode = id2)
under6_2016 <- under6_2016 %>% mutate_each(funs(as.character))
under6_2016 <- under6_2016 %>% mutate_each(funs(as.numeric))
under6_2016 <- filter(under6_2016, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                   78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                   78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                   78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                   78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 
names(total_pop_2016) <- as.matrix(total_pop_2016[1, ])
total_pop_2016 <- total_pop_2016[-1, ]
total_pop_2016 <- clean_names(total_pop_2016)
total_pop_2016 <- rename(total_pop_2016, zipcode = id2)
total_pop_2016 <- total_pop_2016 %>% mutate_each(funs(as.character))
total_pop_2016 <- total_pop_2016 %>% mutate_each(funs(as.numeric))
total_pop_2016 <- filter(total_pop_2016, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                         78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                         78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                         78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                         78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT

under6_2016 <- select(under6_2016, zipcode, estimate_total, estimate_in_households_under_3_years, 
                      estimate_in_households_3_and_4_years, estimate_in_households_5_years)
under6_2016 <- mutate(under6_2016, children_under6 = estimate_in_households_under_3_years + estimate_in_households_3_and_4_years
                      +estimate_in_households_5_years )
total_pop_2016 <- total_pop_2016 %>% select(zipcode, estimate_total) %>% rename(pop_total = estimate_total) 

under6_2016 <- left_join(under6_2016, total_pop_2016, by = "zipcode")
under6_2016 <- mutate(under6_2016, percent_under6 = children_under6/ pop_total, year = 2016)
under6_2016 <- select(under6_2016, zipcode, children_under6, percent_under6, year)

#2017
under6_2017<- read.csv("./ACS_Data/ACS_17_5YR_B09001_with_ann.csv") 
total_pop_2017 <- read.csv("./ACS_Data/ACS_17_5YR_B01003_with_ann.csv") 

names(under6_2017) <- as.matrix(under6_2017[1, ])
under6_2017 <- under6_2017[-1, ]
under6_2017 <- clean_names(under6_2017)
under6_2017 <- rename(under6_2017, zipcode = id2)
under6_2017 <- under6_2017 %>% mutate_each(funs(as.character))
under6_2017 <- under6_2017 %>% mutate_each(funs(as.numeric))
under6_2017 <- filter(under6_2017, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                   78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                   78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                   78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                   78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 
names(total_pop_2017) <- as.matrix(total_pop_2017[1, ])
total_pop_2017 <- total_pop_2017[-1, ]
total_pop_2017 <- clean_names(total_pop_2017)
total_pop_2017 <- rename(total_pop_2017, zipcode = id2)
total_pop_2017 <- total_pop_2017 %>% mutate_each(funs(as.character))
total_pop_2017 <- total_pop_2017 %>% mutate_each(funs(as.numeric))
total_pop_2017 <- filter(total_pop_2017, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                         78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                         78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                         78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                         78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT

under6_2017 <- select(under6_2017, zipcode, estimate_total, estimate_in_households_under_3_years, 
                      estimate_in_households_3_and_4_years, estimate_in_households_5_years)
under6_2017 <- mutate(under6_2017, children_under6 = estimate_in_households_under_3_years + estimate_in_households_3_and_4_years
                      +estimate_in_households_5_years )
total_pop_2017 <- total_pop_2017 %>% select(zipcode, estimate_total) %>% rename(pop_total = estimate_total) 

under6_2017 <- left_join(under6_2017, total_pop_2017, by = "zipcode")
under6_2017 <- mutate(under6_2017, percent_under6 = children_under6/ pop_total, year = 2017)
under6_2017 <- select(under6_2017, zipcode, children_under6, percent_under6, year)

#binding rows to create one table for under6
under6 <- bind_rows(under6_2013, under6_2014, under6_2015, under6_2016, under6_2017)
under6$percent_under6 <- percent(under6$percent_under6)

#save R object 
saveRDS(under6, file = "./under6.RDS")