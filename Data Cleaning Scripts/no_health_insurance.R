#No health insurnace
library(tidyverse)
library(dplyr)
library(janitor)
#2013pulling the csv file into the global environment
insurance_2013<- read.csv("./ACS_Data/ACS_13_5YR_DP03_with_ann.csv")


#2013renaming column headers and filtering for Travis country zipcodes
        names(insurance_2013) <- as.matrix(insurance_2013[1, ])
        insurance_2013 <- insurance_2013[-1, ]
        insurance_2013 <- clean_names(insurance_2013)
        insurance_2013 <- rename(insurance_2013, zipcode = id2)
        insurance_2013 <- insurance_2013 %>% mutate_each(funs(as.character))
        insurance_2013 <- insurance_2013 %>% mutate_each(funs(as.numeric))
        insurance_2013 <- filter(insurance_2013, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                 78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                 78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                 78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                 78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

#2013selecting meaningful columns
        insurance_2013 <- select(insurance_2013, zipcode, contains("health_insurance_coverage"), 
                -(contains("margin")), -(contains("years")), -(contains("estimate")))
        insurance_2013 <- insurance_2013[,-2]
        names(insurance_2013) <- c("zipcode", "percent_with_insurance", "percent_with_private_insurance", 
                "percent_with_public_insurance", "percent_with_no_insurance")

#2013Adding a column for year 
        insurance_2013 <- mutate(insurance_2013, year = 2013)  

#2014
        

insurance_2014<- read.csv("./ACS_Data/ACS_14_5YR_DP03_with_ann.csv")
names(insurance_2014) <- as.matrix(insurance_2014[1, ])
insurance_2014 <- insurance_2014[-1, ]
insurance_2014 <- clean_names(insurance_2014)
insurance_2014 <- rename(insurance_2014, zipcode = id2)
insurance_2014 <- insurance_2014 %>% mutate_each(funs(as.character))
insurance_2014 <- insurance_2014 %>% mutate_each(funs(as.numeric))
insurance_2014 <- filter(insurance_2014, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                         78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                         78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                         78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                         78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT


insurance_2014 <- select(insurance_2014, zipcode, contains("health_insurance_coverage"), 
                         -(contains("margin")), -(contains("years")), -(contains("estimate")))
insurance_2014 <- insurance_2014[,-2]
names(insurance_2014) <- c("zipcode", "percent_with_insurance", "percent_with_private_insurance", 
                           "percent_with_public_insurance", "percent_with_no_insurance")
insurance_2014 <- mutate(insurance_2014, year = 2014)   

#2015

insurance_2015<- read.csv("./ACS_Data/ACS_15_5YR_DP03_with_ann.csv")
names(insurance_2015) <- as.matrix(insurance_2015[1, ])
insurance_2015 <- insurance_2015[-1, ]
insurance_2015 <- clean_names(insurance_2015)
insurance_2015 <- rename(insurance_2015, zipcode = id2)
insurance_2015 <- insurance_2015 %>% mutate_each(funs(as.character))
insurance_2015 <- insurance_2015 %>% mutate_each(funs(as.numeric))
insurance_2015 <- filter(insurance_2015, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                         78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                         78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                         78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                         78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

insurance_2015 <- select(insurance_2015, zipcode, contains("health_insurance_coverage"), 
                         -(contains("margin")), -(contains("years")), -(contains("estimate")))
insurance_2015 <- insurance_2015[,-2]
names(insurance_2015) <- c("zipcode", "percent_with_insurance", "percent_with_private_insurance", 
                           "percent_with_public_insurance", "percent_with_no_insurance")
insurance_2015 <- mutate(insurance_2015, year = 2015)   

#2016

insurance_2016<- read.csv("./ACS_Data/ACS_16_5YR_DP03_with_ann.csv")
names(insurance_2016) <- as.matrix(insurance_2016[1, ])
insurance_2016 <- insurance_2016[-1, ]
insurance_2016 <- clean_names(insurance_2016)
insurance_2016 <- rename(insurance_2016, zipcode = id2)
insurance_2016 <- insurance_2016 %>% mutate_each(funs(as.character))
insurance_2016 <- insurance_2016 %>% mutate_each(funs(as.numeric))
insurance_2016 <- filter(insurance_2016, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                         78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                         78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                         78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                         78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT

insurance_2016 <- select(insurance_2016, zipcode, contains("health_insurance_coverage"), 
                         -(contains("margin")), -(contains("years")), -(contains("estimate")))
insurance_2016 <- insurance_2016[,-2]
names(insurance_2016) <- c("zipcode", "percent_with_insurance", "percent_with_private_insurance", 
                           "percent_with_public_insurance", "percent_with_no_insurance")
insurance_2016 <- mutate(insurance_2016, year = 2016) 


#2017

insurance_2017<- read.csv("./ACS_Data/ACS_17_5YR_DP03_with_ann.csv")
names(insurance_2017) <- as.matrix(insurance_2017[1, ])
insurance_2017 <- insurance_2017[-1, ]
insurance_2017 <- clean_names(insurance_2017)
insurance_2017 <- rename(insurance_2017, zipcode = id2)
insurance_2017 <- insurance_2017 %>% mutate_each(funs(as.character))
insurance_2017 <- insurance_2017 %>% mutate_each(funs(as.numeric))
insurance_2017 <- filter(insurance_2017, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                         78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                         78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                         78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                         78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

insurance_2017 <- select(insurance_2017, zipcode, contains("health_insurance_coverage"), 
                         -(contains("margin")), -(contains("years")), -(contains("estimate")))
insurance_2017 <- insurance_2017[,-2]
names(insurance_2017) <- c("zipcode", "percent_with_insurance", "percent_with_private_insurance", 
                           "percent_with_public_insurance", "percent_with_no_insurance")
insurance_2017 <- mutate(insurance_2017, year = 2017)


#binding rows
insurance <- bind_rows(insurance_2013, insurance_2014, insurance_2015, insurance_2016, insurance_2017)
insurance$percent_with_insurance <- paste0(insurance$percent_with_insurance, '%')
insurance$percent_with_private_insurance <- paste0(insurance$percent_with_private_insurance, '%')
insurance$percent_with_public_insurance <- paste0(insurance$percent_with_public_insurance, '%')
insurance$percent_with_no_insurance <- paste0(insurance$percent_with_no_insurance, '%')

#save r Object
saveRDS(insurance, file = "./health_insurance.RDS")
