#percent of Children under 6 by zipcode 

library(tidyverse)
library(dplyr)
library(janitor)
library(scales)


#2016
under6_2016<- read.csv("./ACS_Data/ACS_16_5YR_B09001_with_ann.csv") 
total_pop_2016 <- read.csv("./ACS_Data/ACS_16_5YR_B01003_with_ann.csv") 

names(under6_2016) <- as.matrix(under6_2016[1, ])
under6_2016 <- under6_2016[-1, ]
under6_2016 <- clean_names(under6_2016)
under6_2016 <- rename(under6_2016, zipcode = id2)
under6_2016 <- under6_2016 %>% mutate_each(funs(as.character))
under6_2016 <- under6_2016 %>% mutate_each(funs(as.numeric))
under6_2016 <- filter(under6_2016, zipcode %in% c( 78705,78617,78641,78645,78652,78653,78660,78701,78702
                                                   ,78703,78704,78719,78721,78722,78723,78724,78725
                                                   ,78727,78728,78730,78731,78732,78733,78734,78735
                                                   ,78736,78738,78739,78741,78742,78743,78744,78745
                                                   ,78746,78747,78748,78749,78750,78751,78752,78753
                                                   ,78754,78756,78757,78758,78759,78654,78610,78621
                                                   ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT 
names(total_pop_2016) <- as.matrix(total_pop_2016[1, ])
total_pop_2016 <- total_pop_2016[-1, ]
total_pop_2016 <- clean_names(total_pop_2016)
total_pop_2016 <- rename(total_pop_2016, zipcode = id2)
total_pop_2016 <- total_pop_2016 %>% mutate_each(funs(as.character))
total_pop_2016 <- total_pop_2016 %>% mutate_each(funs(as.numeric))
total_pop_2016 <- filter(total_pop_2016, zipcode %in% c( 78705,78617,78641,78645,78652,78653,78660,78701,78702
                                                         ,78703,78704,78719,78721,78722,78723,78724,78725
                                                         ,78727,78728,78730,78731,78732,78733,78734,78735
                                                         ,78736,78738,78739,78741,78742,78743,78744,78745
                                                         ,78746,78747,78748,78749,78750,78751,78752,78753
                                                         ,78754,78756,78757,78758,78759,78654,78610,78621
                                                         ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT

under6_2016 <- select(under6_2016, zipcode, estimate_total, estimate_in_households_under_3_years, 
                      estimate_in_households_3_and_4_years, estimate_in_households_5_years)
under6_2016 <- mutate(under6_2016, children_under6 = estimate_in_households_under_3_years + estimate_in_households_3_and_4_years
                      +estimate_in_households_5_years )
total_pop_2016 <- total_pop_2016 %>% select(zipcode, estimate_total) %>% rename(pop_total = estimate_total) 

under6_2016 <- left_join(under6_2016, total_pop_2016, by = "zipcode")
year2016 <- ymd(20160101)
under6_2016 <- mutate(under6_2016, percent_under6 = children_under6/ pop_total, date = year2016)
under6_2016 <- select(under6_2016, zipcode, children_under6, percent_under6, date)

#2017
under6_2017<- read.csv("./ACS_Data/ACS_17_5YR_B09001_with_ann.csv") 
total_pop_2017 <- read.csv("./ACS_Data/ACS_17_5YR_B01003_with_ann.csv") 

names(under6_2017) <- as.matrix(under6_2017[1, ])
under6_2017 <- under6_2017[-1, ]
under6_2017 <- clean_names(under6_2017)
under6_2017 <- rename(under6_2017, zipcode = id2)
under6_2017 <- under6_2017 %>% mutate_each(funs(as.character))
under6_2017 <- under6_2017 %>% mutate_each(funs(as.numeric))
under6_2017 <- filter(under6_2017, zipcode %in% c( 78705,78617,78641,78645,78652,78653,78660,78701,78702
                                                   ,78703,78704,78719,78721,78722,78723,78724,78725
                                                   ,78727,78728,78730,78731,78732,78733,78734,78735
                                                   ,78736,78738,78739,78741,78742,78743,78744,78745
                                                   ,78746,78747,78748,78749,78750,78751,78752,78753
                                                   ,78754,78756,78757,78758,78759,78654,78610,78621
                                                   ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT 
names(total_pop_2017) <- as.matrix(total_pop_2017[1, ])
total_pop_2017 <- total_pop_2017[-1, ]
total_pop_2017 <- clean_names(total_pop_2017)
total_pop_2017 <- rename(total_pop_2017, zipcode = id2)
total_pop_2017 <- total_pop_2017 %>% mutate_each(funs(as.character))
total_pop_2017 <- total_pop_2017 %>% mutate_each(funs(as.numeric))
total_pop_2017 <- filter(total_pop_2017, zipcode %in% c( 78705,78617,78641,78645,78652,78653,78660,78701,78702
                                                         ,78703,78704,78719,78721,78722,78723,78724,78725
                                                         ,78727,78728,78730,78731,78732,78733,78734,78735
                                                         ,78736,78738,78739,78741,78742,78743,78744,78745
                                                         ,78746,78747,78748,78749,78750,78751,78752,78753
                                                         ,78754,78756,78757,78758,78759,78654,78610,78621
                                                         ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT

under6_2017 <- select(under6_2017, zipcode, estimate_total, estimate_in_households_under_3_years, 
                      estimate_in_households_3_and_4_years, estimate_in_households_5_years)
under6_2017 <- mutate(under6_2017, children_under6 = estimate_in_households_under_3_years + estimate_in_households_3_and_4_years
                      +estimate_in_households_5_years )
total_pop_2017 <- total_pop_2017 %>% select(zipcode, estimate_total) %>% rename(pop_total = estimate_total) 

under6_2017 <- left_join(under6_2017, total_pop_2017, by = "zipcode")
year2017 <- ymd(20170101)
under6_2017 <- mutate(under6_2017, percent_under6 = children_under6/ pop_total, date = year2017)
under6_2017 <- select(under6_2017, zipcode, children_under6, percent_under6, date)

#binding rows to create one table for under6
under6 <- bind_rows(under6_2016, under6_2017)
under6$percent_under6 <- percent(under6$percent_under6)

#save R object 
saveRDS(under6, file = "./R Objects/under6.RDS")