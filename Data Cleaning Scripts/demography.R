#Travis County demographics  
library(tidyverse)
library(dplyr)
library(janitor)


#2016

demography_2016<- read.csv("./ACS_Data/ACS_16_5YR_DP05_with_ann.csv")

#data cleaning 
names(demography_2016) <- as.matrix(demography_2016[1, ])
demography_2016 <- demography_2016[-1, ]
demography_2016 <- clean_names(demography_2016)
demography_2016 <- rename(demography_2016, zipcode = id2)
demography_2016 <- demography_2016 %>% mutate_each(funs(as.character))
demography_2016 <- demography_2016 %>% mutate_each(funs(as.numeric))
demography_2016 <- filter(demography_2016, zipcode %in% c( 78705,78617,78641,78645,78652,78653,78660,78701,78702
                                                           ,78703,78704,78719,78721,78722,78723,78724,78725
                                                           ,78727,78728,78730,78731,78732,78733,78734,78735
                                                           ,78736,78738,78739,78741,78742,78743,78744,78745
                                                           ,78746,78747,78748,78749,78750,78751,78752,78753
                                                           ,78754,78756,78757,78758,78759,78654,78610,78621
                                                           ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT


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

#setting the date 
date2016 <- ymd(20160101)
demography_2016 <- mutate(demography_2016, date = date2016)


#2017

demography_2017<- read.csv("./ACS_Data/ACS_17_5YR_DP05_with_ann.csv")
names(demography_2017) <- as.matrix(demography_2017[1, ])
demography_2017 <- demography_2017[-1, ]
demography_2017 <- clean_names(demography_2017)
demography_2017 <- rename(demography_2017, zipcode = id2)
demography_2017 <- demography_2017 %>% mutate_each(funs(as.character))
demography_2017 <- demography_2017 %>% mutate_each(funs(as.numeric))
demography_2017 <- filter(demography_2017, zipcode %in% c( 78705,78617,78641,78645,78652,78653,78660,78701,78702
                                                           ,78703,78704,78719,78721,78722,78723,78724,78725
                                                           ,78727,78728,78730,78731,78732,78733,78734,78735
                                                           ,78736,78738,78739,78741,78742,78743,78744,78745
                                                           ,78746,78747,78748,78749,78750,78751,78752,78753
                                                           ,78754,78756,78757,78758,78759,78654,78610,78621
                                                           ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT 

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

date2017 <- ymd(20170101)
demography_2017 <- mutate(demography_2017, date = date2017)


#binding rows
demography <- bind_rows(demography_2016, demography_2017)
demography$percent_hispanic <- paste0(demography$percent_hispanic, '%')
demography$percent_white_alone <- paste0(demography$percent_white_alone, '%')
demography$percent_black_alone <- paste0(demography$percent_black_alone, '%')
demography$percent_asian_alone <- paste0(demography$percent_asian_alone, '%')

#saving data 
saveRDS(demography, file = "./R Objects/demographics.RDS")
