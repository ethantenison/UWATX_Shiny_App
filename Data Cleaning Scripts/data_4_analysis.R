#Data for Analysis 

library(dplyr)
library(readr)


#reading the existing data 
data <- read_rds("./R Objects/data_4_download.RDS")

convert_columns <- colnames(data[3:24])

data_4_analysis <- reshape(data, idvar = c("date", "zipcode"), varying = c(convert_columns),
                           v.name = c("statistic"), times = c(convert_columns),
                           new.row.names = 1:2288, direction = "long")

data_4_analysis <- rename(data_4_analysis, measure = time)
          