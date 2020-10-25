# library(knitr)
library(dplyr)
# library(readr)
# library(ggplot2)
# library(tibble)
# library(stringr)
# library(gridExtra)
# library(scales)
# library(lubridate)
# library(ggrepel)
library(leaflet)
library(rgdal)
library (htmlwidgets)
library(sf)
library(leaflet.extras)
# library(mapview)
library(maptools)

plants <- read.csv("plants_atlas_data.csv",header = TRUE)
head(plants)
labels <- paste0("<strong>Name: </strong>", plants$Common.Name)%>% lapply(htmltools::HTML)
leaflet(plants) %>%
  setView(lng=144.817487, lat=-37.053477, zoom=6) %>%
  addTiles() %>%
  addProviderTiles("CartoDB.Positron", group="Light map") %>%
  addProviderTiles("Esri.NatGeoWorldMap", group= "Green map") %>%
  addScaleBar %>%
  addMarkers(~Longitude, ~Latitude,
             label = labels,  
             clusterOptions = markerClusterOptions()) %>%
  addLayersControl(baseGroups = c("Green map", "Light map"), options = layersControlOptions(collapsed = FALSE))

# saveWidget(plants,'plants.html')
# mapshot(plants, url = "plants.html")
# saveWidget(plants, 'plants.html', selfcontained = FALSE)
steam

plants_suburb <- read.csv('Separated_plants.csv', header = TRUE)
plants_suburb <- plants_suburb[1,'VIC_LOCA_2']
str(plants_suburb)
if (any(is.na(plants_suburb[,"VIC_LOCA_2"]))) {next}
hmm <- unique(plants_suburb$VIC_LOCA_2)
hmm[hmm.VIC_LOCA_2 == 'ABBOTSFORD',]


proxy <- data.frame(Common.Name = plantssh saodhsa
                    Latitue = plants[ lokashdflksa]
                    Longitu)

new_data <- rbind(new_data,proxy)
