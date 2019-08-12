#No health insurnace
library(tidyverse)
library(dplyr)
library(janitor)
 

#2016

insurance_2016<- read.csv("./ACS_Data/ACS_16_5YR_DP03_with_ann.csv")
names(insurance_2016) <- as.matrix(insurance_2016[1, ])
insurance_2016 <- insurance_2016[-1, ]
insurance_2016 <- clean_names(insurance_2016)
insurance_2016 <- rename(insurance_2016, zipcode = id2)
insurance_2016 <- insurance_2016 %>% mutate_each(funs(as.character))
insurance_2016 <- insurance_2016 %>% mutate_each(funs(as.numeric))
insurance_2016 <- filter(insurance_2016, zipcode %in% c( 78705,78617,78641,78645,78652,78653,78660,78701,78702
                                                         ,78703,78704,78719,78721,78722,78723,78724,78725
                                                         ,78727,78728,78730,78731,78732,78733,78734,78735
                                                         ,78736,78738,78739,78741,78742,78743,78744,78745
                                                         ,78746,78747,78748,78749,78750,78751,78752,78753
                                                         ,78754,78756,78757,78758,78759,78654,78610,78621
                                                         ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT

insurance_2016 <- select(insurance_2016, zipcode, contains("health_insurance_coverage"), 
                         -(contains("margin")), -(contains("years")), -(contains("estimate")))
insurance_2016 <- insurance_2016[,-2]
names(insurance_2016) <- c("zipcode", "percent_with_insurance", "percent_with_private_insurance", 
                           "percent_with_public_insurance", "percent_with_no_insurance")

year2016 <- ymd(20160101)
insurance_2016 <- mutate(insurance_2016, date = year2016)  

#2017

insurance_2017<- read.csv("./ACS_Data/ACS_17_5YR_DP03_with_ann.csv")
names(insurance_2017) <- as.matrix(insurance_2017[1, ])
insurance_2017 <- insurance_2017[-1, ]
insurance_2017 <- clean_names(insurance_2017)
insurance_2017 <- rename(insurance_2017, zipcode = id2)
insurance_2017 <- insurance_2017 %>% mutate_each(funs(as.character))
insurance_2017 <- insurance_2017 %>% mutate_each(funs(as.numeric))
insurance_2017 <- filter(insurance_2017, zipcode %in% c( 78705,78617,78641,78645,78652,78653,78660,78701,78702
                                                         ,78703,78704,78719,78721,78722,78723,78724,78725
                                                         ,78727,78728,78730,78731,78732,78733,78734,78735
                                                         ,78736,78738,78739,78741,78742,78743,78744,78745
                                                         ,78746,78747,78748,78749,78750,78751,78752,78753
                                                         ,78754,78756,78757,78758,78759,78654,78610,78621
                                                         ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT 

insurance_2017 <- select(insurance_2017, zipcode, contains("health_insurance_coverage"), 
                         -(contains("margin")), -(contains("years")), -(contains("estimate")))
insurance_2017 <- insurance_2017[,-2]
names(insurance_2017) <- c("zipcode", "percent_with_insurance", "percent_with_private_insurance", 
                           "percent_with_public_insurance", "percent_with_no_insurance")

year2017 <- ymd(20170101)
insurance_2017 <- mutate(insurance_2017, date = year2017)  


#binding rows
insurance <- bind_rows(insurance_2016, insurance_2017)
insurance$percent_with_insurance <- paste0(insurance$percent_with_insurance, '%')
insurance$percent_with_private_insurance <- paste0(insurance$percent_with_private_insurance, '%')
insurance$percent_with_public_insurance <- paste0(insurance$percent_with_public_insurance, '%')
insurance$percent_with_no_insurance <- paste0(insurance$percent_with_no_insurance, '%')

#save r Object
saveRDS(insurance, file = "./R Objects/health_insurance.RDS")
