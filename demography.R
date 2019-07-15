#Travis County demographics  
library(tidyverse)
library(dplyr)
library(janitor)
#2013pulling the csv file into the global environment
demography_2013<- read.csv("./ACS_Data/ACS_13_5YR_DP05_with_ann.csv")

#you may have to come back and fix the year 2015 

#2013renaming column headers and filtering for Travis country zipcodes
names(demography_2013) <- as.matrix(demography_2013[1, ])
demography_2013 <- demography_2013[-1, ]
demography_2013 <- clean_names(demography_2013)
demography_2013 <- rename(demography_2013, zipcode = id2)
demography_2013 <- demography_2013 %>% mutate_each(funs(as.character))
demography_2013 <- demography_2013 %>% mutate_each(funs(as.numeric))
demography_2013 <- filter(demography_2013, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                           78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                           78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                           78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                           78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

#2013selecting meaningful columns
demography_2013 <- select(demography_2013, zipcode, contains("latino"), -(contains("margin")), -(contains("sex")))
demography_2013 <- select(demography_2013, zipcode, percent_hispanic_or_latino_and_race_total_population_hispanic_or_latino_of_any_race
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_white_alone
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_black_or_african_american_alone
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_asian_alone
                          )

demography_2013 <- rename(demography_2013, percent_hispanic = percent_hispanic_or_latino_and_race_total_population_hispanic_or_latino_of_any_race
                          ,percent_white_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_white_alone
                          ,percent_black_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_black_or_african_american_alone
                          ,percent_asian_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_asian_alone
                          )

#2013Adding a column for year 
demography_2013 <- mutate(demography_2013, year = 2013)  

#2014
demography_2014<- read.csv("./ACS_Data/ACS_14_5YR_DP05_with_ann.csv")
names(demography_2014) <- as.matrix(demography_2014[1, ])
demography_2014 <- demography_2014[-1, ]
demography_2014 <- clean_names(demography_2014)
demography_2014 <- rename(demography_2014, zipcode = id2)
demography_2014 <- demography_2014 %>% mutate_each(funs(as.character))
demography_2014 <- demography_2014 %>% mutate_each(funs(as.numeric))
demography_2014 <- filter(demography_2014, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                           78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                           78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                           78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                           78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT


demography_2014 <- select(demography_2014, zipcode, contains("latino"), -(contains("margin")), -(contains("sex")))
demography_2014 <- select(demography_2014, zipcode, percent_hispanic_or_latino_and_race_total_population_hispanic_or_latino_of_any_race
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_white_alone
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_black_or_african_american_alone
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_asian_alone
)

demography_2014 <- rename(demography_2014, percent_hispanic = percent_hispanic_or_latino_and_race_total_population_hispanic_or_latino_of_any_race
                          ,percent_white_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_white_alone
                          ,percent_black_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_black_or_african_american_alone
                          ,percent_asian_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_asian_alone
)

demography_2014 <- mutate(demography_2014, year = 2014)   

#2015

demography_2015<- read.csv("./ACS_Data/ACS_15_5YR_DP05_with_ann.csv")
names(demography_2015) <- as.matrix(demography_2015[1, ])
demography_2015 <- demography_2015[-1, ]
demography_2015 <- clean_names(demography_2015)
demography_2015 <- rename(demography_2015, zipcode = id2)
demography_2015 <- demography_2015 %>% mutate_each(funs(as.character))
demography_2015 <- demography_2015 %>% mutate_each(funs(as.numeric))
demography_2015 <- filter(demography_2015, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                           78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                           78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                           78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                           78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

demography_2015 <- select(demography_2015, zipcode, contains("latino"), -(contains("margin")), -(contains("sex")))
demography_2015 <- select(demography_2015, zipcode, percent_hispanic_or_latino_and_race_total_population_hispanic_or_latino_of_any_race
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_white_alone
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_black_or_african_american_alone
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_asian_alone
)

demography_2015 <- rename(demography_2015, percent_hispanic = percent_hispanic_or_latino_and_race_total_population_hispanic_or_latino_of_any_race
                          ,percent_white_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_white_alone
                          ,percent_black_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_black_or_african_american_alone
                          ,percent_asian_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_asian_alone
)

demography_2015 <- mutate(demography_2015, year = 2015)   

#2016

demography_2016<- read.csv("./ACS_Data/ACS_16_5YR_DP05_with_ann.csv")
names(demography_2016) <- as.matrix(demography_2016[1, ])
demography_2016 <- demography_2016[-1, ]
demography_2016 <- clean_names(demography_2016)
demography_2016 <- rename(demography_2016, zipcode = id2)
demography_2016 <- demography_2016 %>% mutate_each(funs(as.character))
demography_2016 <- demography_2016 %>% mutate_each(funs(as.numeric))
demography_2016 <- filter(demography_2016, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                           78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                           78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                           78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                           78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT


demography_2016 <- select(demography_2016, zipcode, contains("latino"), -(contains("margin")), -(contains("sex")))
demography_2016 <- select(demography_2016, zipcode, percent_hispanic_or_latino_and_race_total_population_hispanic_or_latino_of_any_race
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_white_alone
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_black_or_african_american_alone
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_asian_alone
)

demography_2016 <- rename(demography_2016, percent_hispanic = percent_hispanic_or_latino_and_race_total_population_hispanic_or_latino_of_any_race
                          ,percent_white_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_white_alone
                          ,percent_black_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_black_or_african_american_alone
                          ,percent_asian_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_asian_alone
)

demography_2016 <- mutate(demography_2016, year = 2016) 

#2017

demography_2017<- read.csv("./ACS_Data/ACS_17_5YR_DP05_with_ann.csv")
names(demography_2017) <- as.matrix(demography_2017[1, ])
demography_2017 <- demography_2017[-1, ]
demography_2017 <- clean_names(demography_2017)
demography_2017 <- rename(demography_2017, zipcode = id2)
demography_2017 <- demography_2017 %>% mutate_each(funs(as.character))
demography_2017 <- demography_2017 %>% mutate_each(funs(as.numeric))
demography_2017 <- filter(demography_2017, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                           78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                           78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                           78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                           78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

demography_2017 <- select(demography_2017, zipcode, contains("latino"), -(contains("margin")), -(contains("sex")))
demography_2017 <- select(demography_2017, zipcode, percent_hispanic_or_latino_and_race_total_population_hispanic_or_latino_of_any_race
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_white_alone
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_black_or_african_american_alone
                          ,percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_asian_alone
)

demography_2017 <- rename(demography_2017, percent_hispanic = percent_hispanic_or_latino_and_race_total_population_hispanic_or_latino_of_any_race
                          ,percent_white_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_white_alone
                          ,percent_black_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_black_or_african_american_alone
                          ,percent_asian_alone = percent_hispanic_or_latino_and_race_total_population_not_hispanic_or_latino_asian_alone
)

demography_2017 <- mutate(demography_2017, year = 2017)


#binding rows
demography <- bind_rows(demography_2013, demography_2014, demography_2015, demography_2016, demography_2017)
demography$percent_hispanic <- paste0(demography$percent_hispanic, '%')
demography$percent_white_alone <- paste0(demography$percent_white_alone, '%')
demography$percent_black_alone <- paste0(demography$percent_black_alone, '%')
demography$percent_asian_alone <- paste0(demography$percent_asian_alone, '%')

#saving data 
saveRDS(demography, file = "./demographics.RDS")
