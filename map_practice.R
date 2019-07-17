library(sf)
library(ggplot2)
library(leaflet)
library(tmap)
library(tmaptools)
library(readr)

#so numbers do not show as scientific notation 
options(scipen = 999)

demographics <- readRDS("demographics.RDS")

mymap <- st_read("tl_2015_us_zcta510.shp", stringsAsFactors = FALSE)
mymap$GEOID10 <- as.numeric(mymap$GEOID10)

mymap_and_demograpics <- inner_join(demographics, mymap, by = c("zipcode" = "GEOID10"))
mymap_and_demograpics2016 <- filter(mymap_and_demograpics, year == 2016)

ggplot(mymap_and_demograpics2016) + geom_sf(aes(fill= percent_hispanic, geometry = geometry)) + scale_fill_gradient2(low = "white", high = "green")

#tmap 
mymap_and_demograpics2016 <- st_as_sf(mymap_and_demograpics2016)
tm_shape(mymap_and_demograpics2016) + tm_polygons("percent_hispanic", id = "zipcode", palette = "Greens")

