#treemap master document with more details about calls 
library(xlsx)
library(dplyr)
library(janitor)
library(readr)
library(openxlsx)
library(lubridate)

#2016
icarol_2016 <- openxlsx::read.xlsx("./211 Data/2016 CNT iCarol Export.xlsx", 
                                   sheet = 1, startRow = 1, colNames = TRUE)

#2016renaming column headers and filtering for Travis country zipcodes
icarol_2016 <- clean_names(icarol_2016)

icarol_2016 <- filter(icarol_2016, zip_code
                      %in% c(78617,78641,78645,78652,78653,78660,78701,78702
                             ,78703,78704,78719,78721,78722,78723,78724,78725
                             ,78727,78728,78730,78731,78732,78733,78734,78735
                             ,78736,78738,78739,78741,78742,78743,78744,78745
                             ,78746,78747,78748,78749,78750,78751,78752,78753
                             ,78754,78756,78757,78758,78759,78654,78610,78621
                             ,78615,78669,78737,78620,78726)) 

icarol_2016 <- filter(icarol_2016, call_type != "Transfer")
icarol_2016 <- filter(icarol_2016, call_type != "Disconnect")
icarol_2016 <- select(icarol_2016, age, zip_code, gender, preferred_language, need_name)

#reassigning age into bins
for (i in 1:length(icarol_2016$age)){
  if(icarol_2016$age[i] <= 12){        
    icarol_2016$age[i] <- "Children (0-12)"               
  }
  else if(icarol_2016$age[i] >= 13 & icarol_2016$age[i] < 18){        
    icarol_2016$age[i] <- "Teens (13-18)"              
  }
  else if(icarol_2016$age[i] >= 18 & icarol_2016$age[i] <=  24){        
    icarol_2016$age[i] <- "Adults (18-24)"              
  }
  else if(icarol_2016$age[i] >= 25 & icarol_2016$age[i] <=  34){        
    icarol_2016$age[i] <- "Adults (25-34)"              
  }
  else if(icarol_2016$age[i] >= 35 & icarol_2016$age[i] <=  44){        
    icarol_2016$age[i] <- "Adults (35-44)"  
  }
  else if(icarol_2016$age[i] >= 45 & icarol_2016$age[i] <=  54){        
    icarol_2016$age[i] <- "Adults (45-54)"              
  }
  else if(icarol_2016$age[i] >= 55 & icarol_2016$age[i] <=  64){        
    icarol_2016$age[i] <- "Adults (55-64)"              
  }
  else if(icarol_2016$age[i] >= 65 & icarol_2016$age[i] <=  74){        
    icarol_2016$age[i] <- "Adults (65-74)"              
  }
  else if(icarol_2016$age[i] >= 75){        
    icarol_2016$age[i] <- "Adults (75+)"              
  }
}
#adding count variable and year 
icarol_2016 <- mutate(icarol_2016, count = 1)

date2016 <- ymd(20160101)
icarol_2016 <- mutate(icarol_2016, Year = date2016)
icarol_2016 <- rename(icarol_2016, zipcode = zip_code)

treemap_master16<- select(icarol_2016, Year, zipcode, age, gender, preferred_language, need_name,
                          count)

#2017
icarol_2017 <- openxlsx::read.xlsx("./211 Data/2017 iCarol Export 1.3.18.xlsx", 
                                   sheet = 2, startRow = 1, colNames = TRUE)

icarol_2017 <- clean_names(icarol_2017)

icarol_2017 <- filter(icarol_2017, zip_code
                      %in% c(78617,78641,78645,78652,78653,78660,78701,78702
                             ,78703,78704,78719,78721,78722,78723,78724,78725
                             ,78727,78728,78730,78731,78732,78733,78734,78735
                             ,78736,78738,78739,78741,78742,78743,78744,78745
                             ,78746,78747,78748,78749,78750,78751,78752,78753
                             ,78754,78756,78757,78758,78759,78654,78610,78621
                             ,78615,78669,78737,78620,78726)) 

icarol_2017 <- filter(icarol_2017, call_type != "Transfer")
icarol_2017 <- filter(icarol_2017, call_type != "Disconnect")
icarol_2017 <- select(icarol_2017, age, zip_code, gender, preferred_language, need_name)

for (i in 1:length(icarol_2017$age)){
  if(icarol_2017$age[i] <= 12){        
    icarol_2017$age[i] <- "Children (0-12)"               
  }
  else if(icarol_2017$age[i] >= 13 & icarol_2017$age[i] < 18){        
    icarol_2017$age[i] <- "Teens (13-18)"              
  }
  else if(icarol_2017$age[i] >= 18 & icarol_2017$age[i] <=  24){        
    icarol_2017$age[i] <- "Adults (18-24)"              
  }
  else if(icarol_2017$age[i] >= 25 & icarol_2017$age[i] <=  34){        
    icarol_2017$age[i] <- "Adults (25-34)"              
  }
  else if(icarol_2017$age[i] >= 35 & icarol_2017$age[i] <=  44){        
    icarol_2017$age[i] <- "Adults (35-44)"  
  }
  else if(icarol_2017$age[i] >= 45 & icarol_2017$age[i] <=  54){        
    icarol_2017$age[i] <- "Adults (45-54)"              
  }
  else if(icarol_2017$age[i] >= 55 & icarol_2017$age[i] <=  64){        
    icarol_2017$age[i] <- "Adults (55-64)"              
  }
  else if(icarol_2017$age[i] >= 65 & icarol_2017$age[i] <=  74){        
    icarol_2017$age[i] <- "Adults (65-74)"              
  }
  else if(icarol_2017$age[i] >= 75){        
    icarol_2017$age[i] <- "Adults (75+)"              
  }
}
icarol_2017 <- mutate(icarol_2017, count = 1)

date2017 <- ymd(20170101)
icarol_2017 <- mutate(icarol_2017, Year = date2017)
icarol_2017 <- rename(icarol_2017, zipcode = zip_code)

treemap_master17<- select(icarol_2017, Year, zipcode, age, gender, preferred_language, need_name,
                          count)
#binding and saving 
treemap_master <- bind_rows(treemap_master16, treemap_master17)
saveRDS(treemap_master, file = "./R Objects/treemap_master.RDS")