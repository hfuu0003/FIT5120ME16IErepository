library(leaflet)
library (htmlwidgets)
library(sf)
library(leaflet.extras)
library(rgdal)
library(raster)
library(rgeos)
library(htmltools)

#Here we are using the packages available in R to find the suburbs which each plant belongs in. Therefore, we can then generate the maps based on our map
#Here we will be using the areas that define each and suburb and match them with the plant to find out which subrub each plant is in. By doing this we can 
#significantly reduce the loading time of the maps on the website.

#Filter the plants based on the location of suburbs

#Read data files
suburb = read_sf("vic_locality_polygon_shp/VIC_LOCALITY_POLYGON_shp.shp")
plants <- read.csv("plants_atlas_data.csv",header = TRUE)

#For each dataset
for (df in c(suburb,plants)) {
  
  #Check for any nulls in the dataset
  for (col in colnames(df)) {
    
    if (any(is.na(df[,col])))
      
  }
  
}

#Take the coordinate of the plants
coordinates(plants) <- ~ Longitude + Latitude

#Reproject the map so they have the same CRS
underbool <- spTransform(underbool, CRS("+init=epsg:26978"))
proj4string(dat) <- spTransform(dat, CRS("+init=epsg:26978"))
proj4string(dat) <- proj4string(underbool)

#Filter the data to have column with which suburb the plants are in
over(dat,underbool)
write.csv('plants_atlas_data.csv', header = TRUE)


