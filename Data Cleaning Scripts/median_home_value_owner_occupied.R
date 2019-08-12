
#Median Home Value of owner occupied units  

library(tidyverse)
library(dplyr)


#2016
housing_median_price_2016<- read.csv("./ACS_Data/ACS_16_5YR_DP04_with_ann.csv")
housing_median_price_2016 <- select(housing_median_price_2016, GEO.id2, HC01_VC128)
housing_median_price_2016 <- rename(housing_median_price_2016, zipcode = GEO.id2, housing_median_price = HC01_VC128)
housing_median_price_2016 <- housing_median_price_2016[2:1942,]
housing_median_price_2016 <- mutate(housing_median_price_2016, zipcode = as.numeric(as.character(zipcode)), 
                                    housing_median_price = as.numeric(as.character(housing_median_price)))
housing_median_price_2016 <- filter(housing_median_price_2016, zipcode %in% c( 78705,78617,78641,78645,78652,78653,78660,78701,78702
                                                                               ,78703,78704,78719,78721,78722,78723,78724,78725
                                                                               ,78727,78728,78730,78731,78732,78733,78734,78735
                                                                               ,78736,78738,78739,78741,78742,78743,78744,78745
                                                                               ,78746,78747,78748,78749,78750,78751,78752,78753
                                                                               ,78754,78756,78757,78758,78759,78654,78610,78621
                                                                               ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT 
year2016 <- ymd(20160101)
housing_median_price_2016 <- mutate(housing_median_price_2016, date = year2016)  

#2017
housing_median_price_2017<- read.csv("./ACS_Data/ACS_17_5YR_DP04_with_ann.csv")
housing_median_price_2017 <- select(housing_median_price_2017, GEO.id2, HC01_VC128)
housing_median_price_2017 <- rename(housing_median_price_2017, zipcode = GEO.id2, housing_median_price = HC01_VC128)
housing_median_price_2017 <- housing_median_price_2017[2:1942,]
housing_median_price_2017 <- mutate(housing_median_price_2017, zipcode = as.numeric(as.character(zipcode)), 
                                    housing_median_price = as.numeric(as.character(housing_median_price)))
housing_median_price_2017 <- filter(housing_median_price_2017, zipcode %in% c( 78705,78617,78641,78645,78652,78653,78660,78701,78702
                                                                               ,78703,78704,78719,78721,78722,78723,78724,78725
                                                                               ,78727,78728,78730,78731,78732,78733,78734,78735
                                                                               ,78736,78738,78739,78741,78742,78743,78744,78745
                                                                               ,78746,78747,78748,78749,78750,78751,78752,78753
                                                                               ,78754,78756,78757,78758,78759,78654,78610,78621
                                                                               ,78615,78669,78737,78620,78726)) #78712 is excluded,represents UT
year2017 <- ymd(20170101)
housing_median_price_2017 <- mutate(housing_median_price_2017, date = year2017)  

#Binding the rows to create one dataset  
housing_median_price <- bind_rows(housing_median_price_2016, housing_median_price_2017)

#save r object
saveRDS(housing_median_price, file = "./R Objects/median_housing_price.RDS")