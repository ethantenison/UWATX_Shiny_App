#individual poverty status using 2017 as an example
library(tidyverse)
library(dplyr)

#2017pulling the csv file into the global environment
        poverty_status_2017 <- read.csv("./ACS_Data/ACS_17_5YR_S1701_with_ann.csv")

#2017selecting meaningful columns
        poverty_status_2017 <- select(poverty_status_2017, GEO.id2, HC03_EST_VC01)

#2017renaming column headers and filtering for Travis country zipcodes
        poverty_status_2017 <- rename(poverty_status_2017, zipcode = GEO.id2, percent_below_poverty_level = HC03_EST_VC01)
        poverty_status_2017 <- poverty_status_2017[2:1947,]
        poverty_status_2017 <- mutate(poverty_status_2017, zipcode = as.numeric(as.character(zipcode)), 
                percent_below_poverty_level = as.numeric(as.character(percent_below_poverty_level)))
        poverty_status_2017 <- filter(poverty_status_2017, zipcode %in% c(78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                          78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                          78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                          78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                          78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 
#2017Adding a column for year 
        poverty_status_2017 <- mutate(poverty_status_2017, year = 2017)
        
#2016
        poverty_status_2016 <- read.csv("./ACS_Data/ACS_16_5YR_S1701_with_ann.csv")
        poverty_status_2016 <- select(poverty_status_2016, GEO.id2, HC03_EST_VC01)
        poverty_status_2016 <- rename(poverty_status_2016, zipcode = GEO.id2, percent_below_poverty_level = HC03_EST_VC01)
        poverty_status_2016 <- poverty_status_2016[2:1947,]
        poverty_status_2016 <- mutate(poverty_status_2016, zipcode = as.numeric(as.character(zipcode)), 
                                      percent_below_poverty_level = as.numeric(as.character(percent_below_poverty_level)))
        poverty_status_2016 <- filter(poverty_status_2016, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                           78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                           78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                           78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                           78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 

        poverty_status_2016 <- mutate(poverty_status_2016, year = 2016)
        
#2015
        poverty_status_2015 <- read.csv("./ACS_Data/ACS_15_5YR_S1701_with_ann.csv")
        poverty_status_2015 <- select(poverty_status_2015, GEO.id2, HC03_EST_VC01)
        poverty_status_2015 <- rename(poverty_status_2015, zipcode = GEO.id2, percent_below_poverty_level = HC03_EST_VC01)
        poverty_status_2015 <- poverty_status_2015[2:1947,]
        poverty_status_2015 <- mutate(poverty_status_2015, zipcode = as.numeric(as.character(zipcode)), 
                                      percent_below_poverty_level = as.numeric(as.character(percent_below_poverty_level)))
        poverty_status_2015 <- filter(poverty_status_2015, zipcode %in% c(78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                          78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                          78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                          78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                          78754, 78756, 78757, 78758,78759)) #78712 is excluded, it represents UT 
        
        poverty_status_2015 <- mutate(poverty_status_2015, year = 2015)
        
#2014
        poverty_status_2014 <- read.csv("./ACS_Data/ACS_14_5YR_S1701_with_ann.csv")
        poverty_status_2014 <- select(poverty_status_2014, GEO.id2, HC03_EST_VC01)
        poverty_status_2014 <- rename(poverty_status_2014, zipcode = GEO.id2, percent_below_poverty_level = HC03_EST_VC01)
        poverty_status_2014 <- poverty_status_2014[2:1947,]
        poverty_status_2014 <- mutate(poverty_status_2014, zipcode = as.numeric(as.character(zipcode)), 
                                      percent_below_poverty_level = as.numeric(as.character(percent_below_poverty_level)))
        poverty_status_2014 <- filter(poverty_status_2014, zipcode %in% c(78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                          78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                          78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                          78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                          78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 
        
        poverty_status_2014 <- mutate(poverty_status_2014, year = 2014)
        
#2013
        poverty_status_2013 <- read.csv("./ACS_Data/ACS_13_5YR_S1701_with_ann.csv")
        poverty_status_2013 <- select(poverty_status_2013, GEO.id2, HC03_EST_VC01)
        poverty_status_2013 <- rename(poverty_status_2013, zipcode = GEO.id2, percent_below_poverty_level = HC03_EST_VC01)
        poverty_status_2013 <- poverty_status_2013[2:1947,]
        poverty_status_2013 <- mutate(poverty_status_2013, zipcode = as.numeric(as.character(zipcode)), 
                                      percent_below_poverty_level = as.numeric(as.character(percent_below_poverty_level)))
        poverty_status_2013 <- filter(poverty_status_2013, zipcode %in% c(78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                                          78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                                          78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                                          78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                                          78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 
        
        poverty_status_2013 <- mutate(poverty_status_2013, year = 2013)
        
#Binding the rows to create one dataset for poverty status 
        poverty_status <- bind_rows(poverty_status_2013, poverty_status_2014,poverty_status_2015, poverty_status_2016, poverty_status_2017)