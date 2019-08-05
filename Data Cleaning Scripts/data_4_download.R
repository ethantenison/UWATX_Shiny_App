#data for downloading 
library(dplyr)
library(readr)


#Reading the existing data 
demographics <- read_rds("./R Objects/demographics.RDS")
education_attainment <- read_rds("./R Objects/education_attainment.RDS")
health_insurance <- read_rds("./R Objects/health_insurance.RDS")
median_family_income <- read_rds("./R Objects/median_family_income.RDS")
median_housing_price <- read_rds("./R Objects/median_housing_price.RDS")
median_rent <- read_rds("./R Objects/median_rent.RDS")
over60 <- read_rds("./R Objects/over60.RDS")
percent_below_poverty <- read_rds("./R Objects/percent_below_poverty.RDS")
total_housing_units <- read_rds("./R Objects/total_housing_units.RDS")
under6 <- read_rds("./R Objects/under6.RDS")
total_211_calls <- read_rds("./R Objects/total_211_calls.RDS")

#joining the data
data_4_download <- full_join(demographics, education_attainment, by = c("zipcode", "date"))

data_4_download <- data_4_download %>% full_join(health_insurance, by = c("zipcode", "date")) %>% 
        full_join(median_family_income, by = c("zipcode", "date")) %>% 
        full_join(median_housing_price, by = c("zipcode", "date")) %>% 
        full_join(median_rent, by = c("zipcode", "date")) %>% 
        full_join(over60, by = c("zipcode", "date")) %>% 
        full_join(under6, by = c("zipcode", "date")) %>%
        full_join(percent_below_poverty, by = c("zipcode", "date")) %>% 
        full_join(total_housing_units,by = c("zipcode", "date")) %>% 
        full_join(total_211_calls, by = c("zipcode" , "date")) 

data_4_download <- select(data_4_download, date, zipcode, total_calls, calls_per100HH, everything())
data_4_download <- rename(data_4_download, Year = date)

saveRDS(data_4_download, file = "./R Objects/data_4_download.RDS")