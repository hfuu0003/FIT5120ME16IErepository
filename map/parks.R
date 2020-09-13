library(leaflet)
library (htmlwidgets)
library(sf)
library(leaflet.extras)

location <- readOGR("DogWalkingZones/geo_export_cc36436a-86a2-4a16-8e02-5ec59db6bf4a.shp")
foi <- st_read('points/foi_polygon.shp')
reserve <- foi[foi$FTYPE == 'reserve', ]
reserve <- reserve[reserve$FEATSUBTYP %in% c('park','conservation park','gardens'),]
status <- as.list(reserve$NAME_LABEL)
status <- rapply( status, f=function(x) ifelse(is.na(x),'',x), how="replace" )

m <- leaflet() %>% 
  addTiles() %>% 
  addPolygons(data = location, weight = 0.8, smoothFactor = 2, fillOpacity = 0.4, fillColor = 'purple') %>%
  addPolygons(data = reserve, weight = 0.8, label = lapply(status, HTML), smoothFactor = 2, fillOpacity = 0.4, fillColor = 'purple') %>%
  addEasyButton(easyButton(
    icon="fa-crosshairs", title="Locate Me",
    onClick=JS("function(btn, map){ map.locate({setView: true}); }"))) %>%
  setView(144.9665,-37.8409, zoom = 12)



saveWidget(m,'parks.html')
steam
