#median income 
library(tidyverse)
library(dplyr)
library(janitor)

#2016

median_income_family_2016<- read.csv("./ACS_Data/ACS_16_5YR_B19126_with_ann.csv")
names(median_income_family_2016) <- as.matrix(median_income_family_2016[1, ])
median_income_family_2016 <- median_income_family_2016[-1, ]
median_income_family_2016 <- clean_names(median_income_family_2016)
median_income_family_2016 <- rename(median_income_family_2016, zipcode = id2)
median_income_family_2016 <- median_income_family_2016 %>% mutate_each(funs(as.character))
median_income_family_2016 <- median_income_family_2016 %>% mutate_each(funs(as.numeric))
median_income_family_2016 <- filter(median_income_family_2016, zipcode %in% c( 78617,78641,78645,78652,78653,78660,78701,78702
                                                                               ,78703,78704,78719,78721,78722,78723,78724,78725
                                                                               ,78727,78728,78730,78731,78732,78733,78734,78735
                                                                               ,78736,78738,78739,78741,78742,78743,78744,78745
                                                                               ,78746,78747,78748,78749,78750,78751,78752,78753
                                                                               ,78754,78756,78757,78758,78759,78654,78610,78621
                                                                               ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT


median_income_family_2016 <- select(median_income_family_2016, zipcode, 
                                    estimate_median_family_income_in_the_past_12_months_in_2016_inflation_adjusted_dollars_total)

median_income_family_2016 <- rename(median_income_family_2016, median_family_income =  
                                      estimate_median_family_income_in_the_past_12_months_in_2016_inflation_adjusted_dollars_total)

year2016 <- ymd(20160101)
median_income_family_2016 <- mutate(median_income_family_2016, date = year2016)

#2017

median_income_family_2017<- read.csv("./ACS_Data/ACS_17_5YR_B19126_with_ann.csv")
names(median_income_family_2017) <- as.matrix(median_income_family_2017[1, ])
median_income_family_2017 <- median_income_family_2017[-1, ]
median_income_family_2017 <- clean_names(median_income_family_2017)
median_income_family_2017 <- rename(median_income_family_2017, zipcode = id2)
median_income_family_2017 <- median_income_family_2017 %>% mutate_each(funs(as.character))
median_income_family_2017 <- median_income_family_2017 %>% mutate_each(funs(as.numeric))
median_income_family_2017 <- filter(median_income_family_2017, zipcode %in% c( 78617,78641,78645,78652,78653,78660,78701,78702
                                                                               ,78703,78704,78719,78721,78722,78723,78724,78725
                                                                               ,78727,78728,78730,78731,78732,78733,78734,78735
                                                                               ,78736,78738,78739,78741,78742,78743,78744,78745
                                                                               ,78746,78747,78748,78749,78750,78751,78752,78753
                                                                               ,78754,78756,78757,78758,78759,78654,78610,78621
                                                                               ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT 

median_income_family_2017 <- select(median_income_family_2017, zipcode, 
                                    estimate_median_family_income_in_the_past_12_months_in_2017_inflation_adjusted_dollars_total)

median_income_family_2017 <- rename(median_income_family_2017, median_family_income =  
                                      estimate_median_family_income_in_the_past_12_months_in_2017_inflation_adjusted_dollars_total)


year2017 <- ymd(20170101)
median_income_family_2017 <- mutate(median_income_family_2017, date = year2017)


#binding rows
median_income_family <- bind_rows(median_income_family_2016, median_income_family_2017)

#saving data 
saveRDS(median_income_family, file = "./R Objects/median_family_income.RDS")