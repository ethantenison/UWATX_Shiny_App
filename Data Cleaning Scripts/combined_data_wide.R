#Combining ACS and 211 Data 
library(dplyr)
library(readr)


demographics <- read_rds("demographics.RDS")
education_attainment <- read_rds("education_attainment.RDS")
health_insurance <- read_rds("health_insurance.RDS")
median_family_income <- read_rds("median_family_income.RDS")
median_housing_price <- read_rds("median_housing_price.RDS")
median_rent <- read_rds("median_rent.RDS")
over60 <- read_rds("over60.RDS")
percent_below_poverty <- read_rds("percent_below_poverty.RDS")
total_housing_units <- read_rds("total_housing_units.RDS")
under6 <- read_rds("under6.RDS")

combined_data_wide <- full_join(demographics, education_attainment, by = c("zipcode", "year"))
combined_data_wide <- combined_data_wide %>% full_join(health_insurance, by = c("zipcode", "year")) %>% 
full_join(median_family_income, by = c("zipcode", "year")) %>% full_join(median_housing_price, by = c("zipcode", "year")) %>% full_join(over60, by = c("zipcode", "year")) %>% full_join(percent_below_poverty, by = c("zipcode", "year"))  %>% full_join(total_housing_units, by = c("zipcode", "year")) %>% full_join(under6, by = c("zipcode", "year"))

 
