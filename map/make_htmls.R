rm(list=ls())
library(leaflet)
library (htmlwidgets)
library(sf)
library(leaflet.extras)
library(rgdal)
library(raster)
library(rgeos)
library(htmltools)
library(dplyr)
library(pandas)

location <- read_sf("DogWalkingZones/geo_export_cc36436a-86a2-4a16-8e02-5ec59db6bf4a.shp")
foi <- read_sf('points/foi_polygon.shp')
reserve <- foi[foi$FTYPE == 'reserve', ]
reserve <- reserve[reserve$FEATSUBTYP %in% c('park','conservation park'),]
parks <- read.csv('Sorted_parks.csv', header = TRUE)
plants_suburb <- read.csv("Separated_plants.csv",header = TRUE)
aus_post <- read.csv("australian_postcodes.csv",header = TRUE)
drops <- c("ID","Postcode","State","DC","Type","SA3","SA3.Name","Region","SA4","SA4.Name","Status")
aus_post<-aus_post[ , !(names(aus_post) %in% drops)]
aus_post <- distinct(aus_post, Locality, .keep_all = TRUE)
unique_subs <- distinct(plants_suburb, VIC_LOCA_2, .keep_all = FALSE)

join <- merge(x = unique_subs, y = aus_post, by.x = 'VIC_LOCA_2', by.y = 'Locality', all.x = TRUE )
parkPoly <- merge(x = reserve, y = parks[, c('UFI','VIC_LOCA_2')], by = 'UFI', all.x = TRUE)
# parkPoly <- merge(x = unique_subs, y = parkPoly, by = 'VIC_LOCA_2', all.x = TRUE)
parkPoly[parkPoly$VIC_LOCA_2 == 'ABBEYARD',]
'ABBEYARD',
trial <- list('ABBOTSFORD')
for (sub in unique_subs$VIC_LOCA_2) {
  print(sub)

  tempDF <- plants_suburb[plants_suburb$VIC_LOCA_2 == sub,]
  tempPark <- parkPoly %>% filter(VIC_LOCA_2 == sub)
  tempCoord <- join[join$VIC_LOCA_2 == sub,]
  
  print(nrow(tempPark))
  
  if (nrow(tempPark) == 0) {
  } else {
    status <- as.list(tempPark$NAME_LABEL)
    status <- rapply( status, f=function(x) ifelse(is.na(x),'',x), how="replace" )
  }

  labels <- paste0("<strong>Name: </strong>", tempDF$Common.Name)%>% lapply(htmltools::HTML)


  location <- st_transform(location, CRS('+proj=longlat +datum=WGS84'))
  tempPark<-st_transform(tempPark, CRS('+proj=longlat +datum=WGS84'))

  m <- leaflet() %>%
    addTiles() %>%
    addPolygons(data = location, weight = 0.8, smoothFactor = 2, fillOpacity = 0.4, fillColor = 'purple') %>%
    addPolygons(data = tempPark, weight = 0.8, smoothFactor = 2, fillOpacity = 0.4, fillColor = 'purple',label = lapply(status, HTML),) %>%
    addScaleBar %>%
    addMarkers(tempDF$Longitude, tempDF$Latitude,
               label = labels,
               clusterOptions = markerClusterOptions()) %>%
    addEasyButton(easyButton(
      icon="fa-crosshairs", title="Locate Me",
      onClick=JS("function(btn, map){ map.locate({setView: true}); }"), position = 'bottomright')) %>%
    #addSearchOSM() %>%
    setView(tempCoord[tempCoord$VIC_LOCA_2 == sub, "Long"],tempCoord[tempCoord$VIC_LOCA_2 == sub, "Lat"], zoom = 12)

  name=paste(tempCoord[tempCoord$VIC_LOCA_2 == sub, "VIC_LOCA_2"],".html")

  saveWidget(m,name)


}


for (sub in unique_subs$VIC_LOCA_2) {
  print(sub)
  
}
