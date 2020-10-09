library(leaflet)
library (htmlwidgets)
library(sf)
library(leaflet.extras)
library(rgdal)
library(raster)
library(rgeos)
library(htmltools)


location <- readOGR("DogWalkingZones/geo_export_cc36436a-86a2-4a16-8e02-5ec59db6bf4a.shp")
foi <- readOGR('points/foi_polygon.shp')
reserve <- foi[foi$FTYPE == 'reserve', ]
reserve <- reserve[reserve$FEATSUBTYP %in% c('park','conservation park','gardens'),]
status <- as.list(reserve$NAME_LABEL)
status <- rapply( status, f=function(x) ifelse(is.na(x),'',x), how="replace" )
#plants <- read.csv("plants_atlas_data.csv",header = TRUE)


###############NEW CODE################################
plants_suburb <- read.csv("Separated_plants.csv",header = TRUE)
head(plants_suburb)
suburbs<-plants_suburb["VIC_LOCA_2"] 
head(suburbs)
dim(suburbs)
unique_subs <- suburbs %>% distinct()
dim(unique_subs)
head(unique_subs)
#plants <- read.csv("plants_atlas_data.csv",header = TRUE)
aus_post <- read.csv("australian_postcodes.csv",header = TRUE)
drops <- c("ID","Postcode","State","DC","Type","SA3","SA3.Name","Region","SA4","SA4.Name","Status")
aus_post<-aus_post[ , !(names(aus_post) %in% drops)]
aus_post <- aus_post %>% distinct()
head(aus_post)
suburbs_corrdinates<-merge(x = unique_subs, y = aus_post, by.x = "VIC_LOCA_2", by.y = "Locality", all.x = TRUE)
head(suburbs_corrdinates)
#dummydt=data.frame(matrix(ncol=0,nrow=0))
#head(dummydt)

#head(new_data)
for (row_sub in 1:nrow(suburbs_corrdinates)) {
  new_data <- data.frame(Common.Name = factor(),          # Specify empty vectors in data.frame
                         Latitude = numeric(),
                         Longitude = numeric(),
                         stringsAsFactors = FALSE)
  head(new_data)
  for (row_all in 1:nrow(plants_suburb)){
    
    if(suburbs_corrdinates[row_sub, "VIC_LOCA_2"] == plants_suburb[row_all, "VIC_LOCA_2"]) {
      
      new_data %>% add_row(Common.Name = plants_suburb[row_all, "Common.Name"], Latitude = plants_suburb[row_all, "Latitude"], Longitude=plants_suburb[row_all, "Logitude"])
    
    }
    
  }
  labels <- paste0("<strong>Name: </strong>", new_data$Common.Name)%>% lapply(htmltools::HTML)
  rm(m)
  m <- leaflet() %>% 
    addTiles() %>% 
    addPolygons(data = location, weight = 0.8, smoothFactor = 2, fillOpacity = 0.4, fillColor = 'purple') %>%
    addPolygons(data = reserve, weight = 0.8, label = lapply(status, HTML), smoothFactor = 2, fillOpacity = 0.4, fillColor = 'purple') %>%
    # addCircles(data = plants, lng = plants$Longitude, lat = plants$Latitude, weight = 0.7, radius = 10 ) %>%
    addScaleBar %>%
    addMarkers(new_data$Longitude, new_data$Latitude,
               label = labels,  
               clusterOptions = markerClusterOptions()) %>%
    addEasyButton(easyButton(
      icon="fa-crosshairs", title="Locate Me",
      onClick=JS("function(btn, map){ map.locate({setView: true}); }"), position = 'bottomright')) %>%
    #addSearchOSM() %>%
    setView(suburbs_corrdinates[row_sub, "Long"],suburbs_corrdinates[row_sub, "Lat"], zoom = 12)
  
  name=paste(suburbs_corrdinates[row_sub, "VIC_LOCA_2"],".html")
  
  saveWidget(m,name)
}


https://dayr8ngd7k1ny.cloudfront.net/ALBERT+PARK+.html

url = list()


