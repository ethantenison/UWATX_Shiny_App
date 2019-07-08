#median gross rent 
library(tidyverse)
library(dplyr)
library(janitor)
#2013pulling the csv file into the global environment
medianRent_2013<- read.csv("./ACS_Data/ACS_13_5YR_B25064_with_ann.csv")


#2013renaming column headers and filtering for Travis country zipcodes
names(medianRent_2013) <- as.matrix(medianRent_2013[1, ])
medianRent_2013 <- medianRent_2013[-1, ]
medianRent_2013 <- clean_names(medianRent_2013)
medianRent_2013 <- rename(medianRent_2013, zipcode = id2)
medianRent_2013 <- medianRent_2013 %>% mutate_each(funs(as.character))
medianRent_2013 <- medianRent_2013 %>% mutate_each(funs(as.numeric))
medianRent_2013 <- filter(medianRent_2013, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                           78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                           78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                           78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                           78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

#2013selecting meaningful columns
medianRent_2013 <- select(medianRent_2013, zipcode, estimate_median_gross_rent, 
                          -(contains("margin")), -(geography), -(id))



#2013Adding a column for year 
medianRent_2013 <- mutate(medianRent_2013, year = 2013)  

#2014


medianRent_2014<- read.csv("./ACS_Data/ACS_14_5YR_B25064_with_ann.csv")
names(medianRent_2014) <- as.matrix(medianRent_2014[1, ])
medianRent_2014 <- medianRent_2014[-1, ]
medianRent_2014 <- clean_names(medianRent_2014)
medianRent_2014 <- rename(medianRent_2014, zipcode = id2)
medianRent_2014 <- medianRent_2014 %>% mutate_each(funs(as.character))
medianRent_2014 <- medianRent_2014 %>% mutate_each(funs(as.numeric))
medianRent_2014 <- filter(medianRent_2014, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                           78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                           78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                           78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                           78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT


medianRent_2013 <- select(medianRent_2013, zipcode, estimate_median_gross_rent, 
                          -(contains("margin")), -(geography), -(id))

medianRent_2014 <- mutate(medianRent_2014, year = 2014)   

#2015

medianRent_2015<- read.csv("./ACS_Data/ACS_15_5YR_B25064_with_ann.csv")
names(medianRent_2015) <- as.matrix(medianRent_2015[1, ])
medianRent_2015 <- medianRent_2015[-1, ]
medianRent_2015 <- clean_names(medianRent_2015)
medianRent_2015 <- rename(medianRent_2015, zipcode = id2)
medianRent_2015 <- medianRent_2015 %>% mutate_each(funs(as.character))
medianRent_2015 <- medianRent_2015 %>% mutate_each(funs(as.numeric))
medianRent_2015 <- filter(medianRent_2015, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                           78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                           78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                           78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                           78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

medianRent_2013 <- select(medianRent_2013, zipcode, estimate_median_gross_rent, 
                          -(contains("margin")), -(geography), -(id))

medianRent_2015 <- mutate(medianRent_2015, year = 2015)   

#2016

medianRent_2016<- read.csv("./ACS_Data/ACS_16_5YR_B25064_with_ann.csv")
names(medianRent_2016) <- as.matrix(medianRent_2016[1, ])
medianRent_2016 <- medianRent_2016[-1, ]
medianRent_2016 <- clean_names(medianRent_2016)
medianRent_2016 <- rename(medianRent_2016, zipcode = id2)
medianRent_2016 <- medianRent_2016 %>% mutate_each(funs(as.character))
medianRent_2016 <- medianRent_2016 %>% mutate_each(funs(as.numeric))
medianRent_2016 <- filter(medianRent_2016, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                           78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                           78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                           78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                           78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT

medianRent_2013 <- select(medianRent_2013, zipcode, estimate_median_gross_rent, 
                          -(contains("margin")), -(geography), -(id))

medianRent_2016 <- mutate(medianRent_2016, year = 2016) 

#2017

medianRent_2017<- read.csv("./ACS_Data/ACS_17_5YR_B25064_with_ann.csv")
names(medianRent_2017) <- as.matrix(medianRent_2017[1, ])
medianRent_2017 <- medianRent_2017[-1, ]
medianRent_2017 <- clean_names(medianRent_2017)
medianRent_2017 <- rename(medianRent_2017, zipcode = id2)
medianRent_2017 <- medianRent_2017 %>% mutate_each(funs(as.character))
medianRent_2017 <- medianRent_2017 %>% mutate_each(funs(as.numeric))
medianRent_2017 <- filter(medianRent_2017, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                           78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                           78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                           78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                           78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

medianRent_2013 <- select(medianRent_2013, zipcode, estimate_median_gross_rent, 
                          -(contains("margin")), -(geography), -(id))

medianRent_2017 <- mutate(medianRent_2017, year = 2017)


#binding rows
medianRent <- bind_rows(medianRent_2013, medianRent_2014, medianRent_2015, medianRent_2016, medianRent_2017)

