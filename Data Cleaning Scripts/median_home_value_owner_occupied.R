
#Median Home Value of owner occupied units  

library(tidyverse)
library(dplyr)

#2013pulling the csv file into the global environment
housing_median_price_2013<- read.csv("./ACS_Data/ACS_13_5YR_DP04_with_ann.csv")

#2013selecting meaningful columns
housing_median_price_2013 <- select(housing_median_price_2013, GEO.id2, HC01_VC127)

#2013renaming column headers and filtering for Travis country zipcodes
housing_median_price_2013 <- rename(housing_median_price_2013, zipcode = GEO.id2, housing_median_price = HC01_VC127)
housing_median_price_2013 <- housing_median_price_2013[2:1942,]
housing_median_price_2013 <- mutate(housing_median_price_2013, zipcode = as.numeric(as.character(zipcode)), 
                                    housing_median_price = as.numeric(as.character(housing_median_price)))
housing_median_price_2013 <- filter(housing_median_price_2013, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

#2013Adding a column for year 
housing_median_price_2013 <- mutate(housing_median_price_2013, year = 2013)


#2014
housing_median_price_2014<- read.csv("./ACS_Data/ACS_14_5YR_DP04_with_ann.csv")
housing_median_price_2014 <- select(housing_median_price_2014, GEO.id2, HC01_VC127)
housing_median_price_2014 <- rename(housing_median_price_2014, zipcode = GEO.id2, housing_median_price = HC01_VC127)
housing_median_price_2014 <- housing_median_price_2014[2:1942,]
housing_median_price_2014 <- mutate(housing_median_price_2014, zipcode = as.numeric(as.character(zipcode)), 
                                    housing_median_price = as.numeric(as.character(housing_median_price)))
housing_median_price_2014 <- filter(housing_median_price_2014, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 
housing_median_price_2014 <- mutate(housing_median_price_2014, year = 2014)

#2015
housing_median_price_2015<- read.csv("./ACS_Data/ACS_15_5YR_DP04_with_ann.csv")
housing_median_price_2015 <- select(housing_median_price_2015, GEO.id2, HC01_VC128)
housing_median_price_2015 <- rename(housing_median_price_2015, zipcode = GEO.id2, housing_median_price = HC01_VC128)
housing_median_price_2015 <- housing_median_price_2015[2:1942,]
housing_median_price_2015 <- mutate(housing_median_price_2015, zipcode = as.numeric(as.character(zipcode)), 
                                    housing_median_price = as.numeric(as.character(housing_median_price)))
housing_median_price_2015 <- filter(housing_median_price_2015, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 
housing_median_price_2015 <- mutate(housing_median_price_2015, year = 2015)

#2016
housing_median_price_2016<- read.csv("./ACS_Data/ACS_16_5YR_DP04_with_ann.csv")
housing_median_price_2016 <- select(housing_median_price_2016, GEO.id2, HC01_VC128)
housing_median_price_2016 <- rename(housing_median_price_2016, zipcode = GEO.id2, housing_median_price = HC01_VC128)
housing_median_price_2016 <- housing_median_price_2016[2:1942,]
housing_median_price_2016 <- mutate(housing_median_price_2016, zipcode = as.numeric(as.character(zipcode)), 
                                    housing_median_price = as.numeric(as.character(housing_median_price)))
housing_median_price_2016 <- filter(housing_median_price_2016, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 
housing_median_price_2016 <- mutate(housing_median_price_2016, year = 2016)

#2017
housing_median_price_2017<- read.csv("./ACS_Data/ACS_17_5YR_DP04_with_ann.csv")
housing_median_price_2017 <- select(housing_median_price_2017, GEO.id2, HC01_VC128)
housing_median_price_2017 <- rename(housing_median_price_2017, zipcode = GEO.id2, housing_median_price = HC01_VC128)
housing_median_price_2017 <- housing_median_price_2017[2:1942,]
housing_median_price_2017 <- mutate(housing_median_price_2017, zipcode = as.numeric(as.character(zipcode)), 
                                    housing_median_price = as.numeric(as.character(housing_median_price)))
housing_median_price_2017 <- filter(housing_median_price_2017, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                               78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                               78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                               78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                               78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT
housing_median_price_2017 <- mutate(housing_median_price_2017, year = 2017)

#Binding the rows to create one dataset  
housing_median_price <- bind_rows(housing_median_price_2013, housing_median_price_2014, housing_median_price_2015, housing_median_price_2016, housing_median_price_2017)

#save r object
saveRDS(housing_median_price, file = "./median_housing_price.RDS")