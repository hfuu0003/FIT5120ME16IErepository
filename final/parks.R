rm(list=ls())
library(leaflet)
library (htmlwidgets)
library(sf)
library(leaflet.extras)
library(rgdal)
library(raster)
library(rgeos)
library(htmltools)
#Here we will combine the analysis used to generate locations of parks and gardens in Victoria as well as the plants and plot them all together for the 
#user to use. In this case we will provide a location service as well so that the user doesn't have to manually click and drag to their location.
#Plotting plants and parks

#Load the data that has already been wrangled
location <- readOGR("DogWalkingZones/geo_export_cc36436a-86a2-4a16-8e02-5ec59db6bf4a.shp")
foi <- readOGR('points/foi_polygon.shp')
reserve <- foi[foi$FTYPE == 'reserve', ]
reserve <- reserve[reserve$FEATSUBTYP %in% c('park','conservation park','gardens'),]
status <- as.list(reserve$NAME_LABEL)
status <- rapply( status, f=function(x) ifelse(is.na(x),'',x), how="replace" )
plants <- read.csv("plants_atlas_data.csv",header = TRUE)
labels <- paste0("<strong>Name: </strong>", plants$Common.Name)%>% lapply(htmltools::HTML)

#For each dataset
for (df in c(location,reserve,plants)) {
  
  #Check for any nulls in the dataset
  for (col in colnames(df)) {
    
    if (any(is.na(df[,col])))
      
  }
  
}
  
#Plot the parks and plants in a leaflet
m <- leaflet() %>% 
  addTiles() %>% 
  #Add parks and gardens
  addPolygons(data = location, weight = 0.8, smoothFactor = 2, fillOpacity = 0.4, fillColor = 'purple') %>%
  addPolygons(data = reserve, weight = 0.8, label = lapply(status, HTML), smoothFactor = 2, fillOpacity = 0.4, fillColor = 'purple') %>%
  #Add scale bar
  addScaleBar %>%
  #Add plant locations as markers and create clusters for each
  addMarkers(plants$Longitude, plants$Latitude,
             label = labels,  
             clusterOptions = markerClusterOptions()) %>%
  #Add button that locates the users location
  addEasyButton(easyButton(
    icon="fa-crosshairs", title="Locate Me",
    onClick=JS("function(btn, map){ map.locate({setView: true}); }"), position = 'bottomright')) %>%
  addSearchOSM() %>%
  #Set initial view of the map
  setView(144.9665,-37.8409, zoom = 12)


#Export the leaflet map as a html file
saveWidget(m,'parksV2.0.html')

