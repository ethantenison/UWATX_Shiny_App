#total 211 referalls

data <- read_rds("./R Objects/data_4_download.RDS")

summ211data <- data %>% group_by(Year) %>% summarise(total_referrals = sum(total_calls))


saveRDS(data_4_download, file = "./R Objects/summ211.RDS")

