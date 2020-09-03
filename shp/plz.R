rm(plz)
library(sf)
location <- st_read("vba_fauna25.shp")
plants <- read.csv("Toxic Plant List.csv")
vicflora <- read.csv("vicflora.csv")
head(location)
rm(plantlocation)

together <- merge(vicflora,location, by.x = "scientificName", by.y = "SCI_NAME")

class(location)

location <- as.data.frame(location)
for (index in 1:nrow(location)) {
  location[index,7] <- sub("fam.","",location[index,7])
  
}
class(location2)

colnames(plants)
colnames(location2)

list1 <- sort(unique(location$SCI_NAME))
list2 <- sort(unique(plants$Scientific.Name))
list1
int <- intersect(list1,list2)
location <- as.data.frame(location)
write.csv(location, "location.csv", row.names = FALSE)


