
library(sf)
library(raster)
library(sp)
library(rgdal)
library(rgeos)
library(leaflet)
library(shiny)

location <- readOGR("DogWalkingZones/geo_export_cc36436a-86a2-4a16-8e02-5ec59db6bf4a.shp")
location2 <- st_read("DogWalkingZones/geo_export_cc36436a-86a2-4a16-8e02-5ec59db6bf4a.shp")
map <- readOGR('Map/aus_poas.shp')
foi <- st_read('points/foi_polygon.shp')
unique(foi$FEATSUBTYP)
unique(reserve$FEATSUBTYP)
reserve <- foi[foi$FTYPE == 'reserve', ]
reserve <- reserve[reserve$FEATSUBTYP %in% c('park','conservation park','gardens'),]


reserve[reserve$FEATSUBTYP == 'gardens',]
melb <- map[map$code == 3000,]

both <- union(melb, location)


ui  <- fluidPage(
  
  titlePanel("Dog Walking Zones"),
  leafletOutput('dog')
  
)

server <- function(input,output){
  
  output$dog <- renderLeaflet({
    leaflet() %>% addTiles() %>% addPolygons(data = location, weight = 2) %>% addPolygons(data = reserve, weight = 2)
  })
}


shinyApp(ui = ui, server = server)
