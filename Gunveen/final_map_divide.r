rm(list=ls())
library(leaflet)
library (htmlwidgets)
library(sf)
library(leaflet.extras)
library(rgdal)
library(raster)
#library(rgeos)
library(htmltools)
library(stringr)

location <- readOGR("DogWalkingZones/geo_export_cc36436a-86a2-4a16-8e02-5ec59db6bf4a.shp")
foi <- readOGR('points/foi_polygon.shp')
reserve <- foi[foi$FTYPE == 'reserve', ]
reserve <- reserve[reserve$FEATSUBTYP %in% c('park','conservation park','gardens'),]
status <- as.list(reserve$NAME_LABEL)
status <- rapply( status, f=function(x) ifelse(is.na(x),'',x), how="replace" )
suburbs_corrdinates <- read.csv("suburb_coordinates",header = TRUE)
head(suburbs_corrdinates)
filenames <- list.files("Suburb_dfs", pattern="*.csv", full.names=TRUE)

for (row_sub in 1:nrow(suburbs_corrdinates)) {
  
  for (each in filenames) {
    sub_name=tools::file_path_sans_ext(basename(each))
    if(suburbs_corrdinates[row_sub, "VIC_LOCA_2"] ==sub_name ) {
      
      plants <- read.csv(each,header = TRUE)
      labels <- paste0("<strong>Name: </strong>", plants$Common.Name)%>% lapply(htmltools::HTML)
      
      
      m <- leaflet() %>% 
        addTiles() %>% 
        addPolygons(data = location, weight = 0.8, smoothFactor = 2, fillOpacity = 0.4, fillColor = 'purple') %>%
        addPolygons(data = reserve, weight = 0.8, label = lapply(status, HTML), smoothFactor = 2, fillOpacity = 0.4, fillColor = 'purple') %>%
        # addCircles(data = plants, lng = plants$Longitude, lat = plants$Latitude, weight = 0.7, radius = 10 ) %>%
        addScaleBar %>%
        addMarkers(plants$Longitude, plants$Latitude,
                   label = labels,  
                   clusterOptions = markerClusterOptions()) %>%
        addEasyButton(easyButton(
          icon="fa-crosshairs", title="Locate Me",
          onClick=JS("function(btn, map){ map.locate({setView: true}); }"), position = 'bottomright')) %>%
        addSearchOSM() %>%
        setView(suburbs_corrdinates[row_sub, "Long"],suburbs_corrdinates[row_sub, "Lat"], zoom = 10)
      
      
      html_name=paste(sub_name,".html")
      saveWidget(m,html_name)
      rm(m)
    }
    
    
  }
  
  
  
}
