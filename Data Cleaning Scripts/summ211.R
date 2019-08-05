#total 211 referalls

data <- read_rds("./R Objects/data_4_download.RDS")

summ211data <- data %>% group_by(Year) %>% summarise(total_referrals = sum(total_calls))


saveRDS(data_4_download, file = "./R Objects/summ211.RDS")

#this part I might not even use 
#housing <- read_rds("./R Objects/total_housing_units.RDS")

#total_housing <- housing %>% group_by(date) %>% summarize(total_housing = sum(housing_units))

#summ211data <- left_join(summ211data, total_housing, by = "date")

#summ211data <- mutate(summ211data, calls_per100HH = total_calls / (housing_units/100) )