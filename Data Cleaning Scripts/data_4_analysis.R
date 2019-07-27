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

data_4_analysis <- mutate(data_4_analysis, displayed_measure = recode(data_4_analysis$measure, 
                          total_calls = "Total 211 Calls", calls_per100HH = "211 Calls per 100 Households",
                          percent_hispanic = "Hispanic", percent_white_alone = "White", 
                          percent_black_alone = "Black", percent_asian_alone = "Asian",
                          percent_less_than_highschool = "Less than HS", percent_highschool_GED=
                          "HS Diploma or GED", percent_associates_somecollege = "Associates Degree",
                          percent_bachelors_plus = "Bachelor's and Higher", percent_with_insurance =
                          "Insurance", percent_with_private_insurance = "Private Insurance", 
                          percent_with_public_insurance = "Public Insurance", 
                          percent_with_no_insurance= "No Insurance", median_family_income 
                          = "Median Family Income", housing_median_price = "Median Household Value", 
                          estimate_median_gross_rent = "Median Rent", percent_over60 = "Over 60",
                          children_under6 = "Total Children Under 6", percent_below_poverty_level = 
                          "Poverty 100%", 	percent_under6 = "Under 6", housing_units = "Households"
                                          )
                          )

data_4_analysis <- mutate(data_4_analysis, category = recode(data_4_analysis$measure, 
                          total_calls = "211Data", calls_per100HH = "211Data",
                          percent_hispanic = "Race", percent_white_alone = "Race", 
                          percent_black_alone = "Race", percent_asian_alone = "Race",
                          percent_less_than_highschool = "Education", percent_highschool_GED=
                            "Education", percent_associates_somecollege = "Education",
                          percent_bachelors_plus = "Education", percent_with_insurance =
                            "Insurance", percent_with_private_insurance = "Insurance", 
                          percent_with_public_insurance = "Insurance", 
                          percent_with_no_insurance= "Insurance", median_family_income 
                          = "Financial", housing_median_price = "Financial", 
                          estimate_median_gross_rent = "Financial", percent_over60 = "Age",
                          children_under6 = "Age", percent_below_poverty_level = 
                            "Financial", 	percent_under6 = "Age", housing_units = "Households"
                                          )
                          )

          

