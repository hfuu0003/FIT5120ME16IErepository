#Import neccessary libraries
rm(list=ls())
library(sf)
library(raster)
library(sp)
library(rgdal)
library(rgeos)
library(leaflet)
library(shiny)
library(leaflet.extras)

#Here we are trying to plot the parks and gardens and well as dog walking zone in Victoria. This is one of the first steps used to ensure the accuracy 
#usefulness of our map.

#Load files used to produce the maps
location <- readOGR("DogWalkingZones/geo_export_cc36436a-86a2-4a16-8e02-5ec59db6bf4a.shp")
location2 <- st_read("DogWalkingZones/geo_export_cc36436a-86a2-4a16-8e02-5ec59db6bf4a.shp")

#Check for any nulls in the dataset
for (col in colnames(location)) {
  
  if (any(is.na(df[,col])))
  
}

if (any(is.na(df[,relevant_column])))
#Load files and filter the data for parks and gardens 
foi <- st_read('points/foi_polygon.shp')
unique(foi$FEATSUBTYP) #filter based on sub types
reserve <- foi[foi$FTYPE == 'reserve', ] #filter to only keep reserves in the file
reserve <- reserve[reserve$FEATSUBTYP %in% c('park','conservation park','gardens'),] #filter to only keep parks and gardens in the dataframe

#Use shiny to produce leaflet
ui  <- fluidPage(
  
  titlePanel("Dog Walking Zones"),
  leafletOutput('dog')
  
)

server <- function(input,output){
  
  #Create leaflet map including the parks and gardens
  output$dog <- renderLeaflet({
    leaflet() %>% #Generate map
      addTiles() %>% 
      addPolygons(data = location, weight = 0.8 , stroke = FALSE, smoothFactor = 1, fillOpacity = 0.5, fillColor = 'purple') %>% #Plot gardens and parks
      addPolygons(data = reserve, weight = 2, label = lapply(status, HTML)) %>%
      
      #Add option to zoom in on the user's location
      addEasyButton(easyButton(
        icon="fa-crosshairs", title="Locate Me",
        onClick=JS("function(btn, map){ map.locate({setView: true}); }"), position = 'bottomright')) %>%
      #Set intial page longtitude and latitude
      setView(144.9665,-37.8409, zoom = 12)

  })
}

# status <- as.list(reserve$NAME_LABEL)
shinyApp(ui = ui, server = server)






