#median gross rent 
library(tidyverse)
library(dplyr)
library(janitor)

#2016

medianRent_2016<- read.csv("./ACS_Data/ACS_16_5YR_B25064_with_ann.csv")
names(medianRent_2016) <- as.matrix(medianRent_2016[1, ])
medianRent_2016 <- medianRent_2016[-1, ]
medianRent_2016 <- clean_names(medianRent_2016)
medianRent_2016 <- rename(medianRent_2016, zipcode = id2)
medianRent_2016 <- medianRent_2016 %>% mutate_each(funs(as.character))
medianRent_2016 <- medianRent_2016 %>% mutate_each(funs(as.numeric))
medianRent_2016 <- filter(medianRent_2016, zipcode %in% c( 78617,78641,78645,78652,78653,78660,78701,78702
                                                           ,78703,78704,78719,78721,78722,78723,78724,78725
                                                           ,78727,78728,78730,78731,78732,78733,78734,78735
                                                           ,78736,78738,78739,78741,78742,78743,78744,78745
                                                           ,78746,78747,78748,78749,78750,78751,78752,78753
                                                           ,78754,78756,78757,78758,78759,78654,78610,78621
                                                           ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT

medianRent_2016 <- select(medianRent_2016, zipcode, estimate_median_gross_rent, 
                          -(contains("margin")), -(geography), -(id))

year2016 <- ymd(20160101)
medianRent_2016 <- mutate(medianRent_2016, date = year2016)  

#2017

medianRent_2017<- read.csv("./ACS_Data/ACS_17_5YR_B25064_with_ann.csv")
names(medianRent_2017) <- as.matrix(medianRent_2017[1, ])
medianRent_2017 <- medianRent_2017[-1, ]
medianRent_2017 <- clean_names(medianRent_2017)
medianRent_2017 <- rename(medianRent_2017, zipcode = id2)
medianRent_2017 <- medianRent_2017 %>% mutate_each(funs(as.character))
medianRent_2017 <- medianRent_2017 %>% mutate_each(funs(as.numeric))
medianRent_2017 <- filter(medianRent_2017, zipcode %in% c( 78617,78641,78645,78652,78653,78660,78701,78702
                                                           ,78703,78704,78719,78721,78722,78723,78724,78725
                                                           ,78727,78728,78730,78731,78732,78733,78734,78735
                                                           ,78736,78738,78739,78741,78742,78743,78744,78745
                                                           ,78746,78747,78748,78749,78750,78751,78752,78753
                                                           ,78754,78756,78757,78758,78759,78654,78610,78621
                                                           ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT 

medianRent_2017 <- select(medianRent_2017, zipcode, estimate_median_gross_rent, 
                          -(contains("margin")), -(geography), -(id))

year2017 <- ymd(20170101)
medianRent_2017 <- mutate(medianRent_2017, date = year2017)  


#binding rows
medianRent <- bind_rows(medianRent_2016, medianRent_2017)

#save R object 
saveRDS(medianRent, file = "./R Objects/median_rent.RDS")
