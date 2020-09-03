rm(list=ls())
library(dplyr)
library(tidyr)
library(stringr)

toxic <- read.csv("Toxic Plant List.csv")
vic <- read.csv("vicflora.csv")

head(toxic,1)
head(vic,1)
colnames(vic)[2] <- "Scientific.Name"
try <- merge(toxic,vic, by = c("Scientific.Name"))



what <- unite(try, "Common Name",c(Common.Name,Aliases), remove = TRUE)

for (index in 1:nrow(what)){
  what[index, 2] <- sub("_",", ",what[index,2])
}


hmm <- what[!duplicated(what[ , c("Scientific.Name")]),]

drop <- colnames(hmm[c(4:22)])

final <- hmm[ , !(names(hmm) %in% drop)]
final$id <- NA
final <- final[,c(4,1,2,3)]

only <- final

for (index in 1:nrow(only)) {
  only[index, 3] <- sub(",.*","",only[index,3])
  
}

only$effects <- NA
only$img_dir <- NA
only$item_activation_status_id <- 0
only$item_activation_status_name <- "inactive"
only$item_type_id <- 0
only$item_type_name <- "plant"

drop <- colnames(only[4])
only <- only[,!(names(only) %in% drop)]

write.csv(only,"plantdetails.csv",row.names = FALSE)
