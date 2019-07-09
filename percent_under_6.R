#percent of Children under 6 by zipcode 

library(tidyverse)
library(dplyr)
library(janitor)
#2013pulling the csv file into the global environment
under6_2013<- read.csv("./ACS_Data/ACS_13_5YR_B05009_with_ann.csv") 
total_pop_2013 <- read.csv("./ACS_Data/ACS_13_5YR_B01003_with_ann.csv") 


#2013renaming column headers and filtering for Travis country zipcodes
names(under6_2013) <- as.matrix(under6_2013[1, ])
under6_2013 <- under6_2013[-1, ]
under6_2013 <- clean_names(under6_2013)
under6_2013 <- rename(under6_2013, zipcode = id2)
under6_2013 <- under6_2013 %>% mutate_each(funs(as.character))
under6_2013 <- under6_2013 %>% mutate_each(funs(as.numeric))
under6_2013 <- filter(under6_2013, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                   78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                   78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                   78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                   78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 


#2013selecting meaningful columns
under6_2013 <- select(under6_2013, zipcode, estimate_total, estimate_total_under_6_years)
under6_2013 <- rename(under6_2013, estimate_children_total = estimate_total)
                      
#same stufs for population 
names(total_pop_2013) <- as.matrix(total_pop_2013[1, ])
total_pop_2013 <-total_pop_2013[-1, ]
total_pop_2013 <- clean_names(total_pop_2013)
total_pop_2013 <- rename(total_pop_2013, zipcode = id2)
total_pop_2013<- total_pop_2013 %>% mutate_each(funs(as.character))
total_pop_2013 <- total_pop_2013 %>% mutate_each(funs(as.numeric))
total_pop_2013 <- filter(total_pop_2013, zipcode %in% c( 78617,78641, 78645, 78652, 78653, 78660, 78669, 78691, 78701, 78702, 78703,
                                                   78704, 78705, 78719, 78721, 78722, 78723, 78724, 78725, 78726, 78727, 
                                                   78728, 78730, 78731, 78732,78733, 78734, 78735, 78736, 78738, 78739, 78741,
                                                   78742, 78744, 78745, 78746, 78747, 78748, 78749, 78750, 78751, 78752, 78753, 
                                                   78754, 78756, 78757, 78758,78759)) #78712 is excluded,represents UT 
total_pop_2013 <- select(total_pop_2013, zipcode, estimate_total)

#joining total population column 
under6_2013 <- left_join(under6_2013, total_pop_2013, "zipcode")
under6_2013 <- rename(under6_2013, estimate_total_population = estimate_total)

#2013Adding a column for percent and year 
under6_2013 <- mutate(under6_2013, percent_under6 = estimate_total_under_6_years / estimate_total_population, year = 2013)  



