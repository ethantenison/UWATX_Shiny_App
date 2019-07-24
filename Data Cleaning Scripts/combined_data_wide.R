#Combining ACS and 211 Data 
library(dplyr)
library(readr)
library(sf)

#reading in the data 
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

#adding geography 
#mymap <- st_read("tl_2015_us_zcta510.shp", stringsAsFactors = FALSE)
#mymap$GEOID10 <- as.numeric(mymap$GEOID10)
#mymap <- st_transform(mymap, 32614)


##adding geography attempt 2 
library(tigris)
library(stringr)

zipcodes_polygon <- zctas(cb = TRUE, state = "TX", county = 453)


#joining the data
combined_data_wide <- full_join(demographics, education_attainment, by = c("zipcode", "year"))

combined_data_wide <- combined_data_wide %>% full_join(health_insurance, by = c("zipcode", "year")) %>% 
                full_join(median_family_income, by = c("zipcode", "year")) %>% full_join(median_housing_price, 
                by = c("zipcode", "year")) %>% full_join(over60, by = c("zipcode", "year")) %>% 
                full_join(percent_below_poverty, by = c("zipcode", "year"))  %>% full_join(total_housing_units, 
                by = c("zipcode", "year")) %>% full_join(under6, by = c("zipcode", "year"))

data_polygon <- geo_join(zipcodes_polygon, combined_data_wide, "GEOID", "zipcode", how = "inner")
#combined_data_wide <- inner_join(combined_data_wide, mymap, by = c("zipcode" = "GEOID10"))
#combined_data_wide <- st_as_sf(combined_data_wide)



#Save the data  
saveRDS(combined_data_wide, file = "./R Objects/combined_data_wide.RDS")