rm(list=ls())
library(pdftools)
library(tm)
library(tm)

#This was used gather plants that are toxic to dogs from a pdf into a csv file
#As there are no readily available datasets, we had to source it from a websire. This website was ensured that there are no copyright issues 
#so we proceeded to analysis this dasta

#Read the pdf file  as a test document
opinions <- lapply("Toxic Plant List - Dogs _ ASPCA.pdf",pdf_text)


poison <- paste( unlist(opinions), collapse='')
#Remove the title
poison <- gsub("Toxic and Non-Toxic Plant List - Dogs\\\r\\\nPlants Toxic to Dogs","",poison)

#Use regular expression to gather the first name of plants
first_name <- gsub("","", regmatches(poison, gregexpr("(?<=\\\n)[A-Z]{1}.*(?=\\(\\/pet-care)", poison, perl = TRUE))[[1]])

#Continue removing unecessary documents
poison <- gsub("(?<=\\\n)[A-Z]{1}.*(?=\\(\\/pet-care)"," ",poison, perl=TRUE)
poison <- gsub("\\(\\/pet-care.*?\\)","",poison)
poison <- gsub("\\\r\\\n","",poison)

#Gather the the common names for each plant
other_common_names <- gsub("[\\(\\)]", "", regmatches(poison, gregexpr("\\(.*?\\)", poison))[[1]])
poison <- gsub("\\(.*?\\)","",poison)

#Gather the scientific names of each plant
scientific_names <- gsub("[\\|\\|]", "", regmatches(poison, gregexpr("\\|.*?\\|", poison))[[1]]) 
poison <- gsub("\\|.*?\\|","",poison)
poison <- gsub("(?<=Family:)\\s+(?=Family:)"," Unknown ",poison,perl=TRUE)

#Gather the family which each plant belongs in
family <- gsub("Family: ","", regmatches(poison, gregexpr("(?<=Family:).*?(?=Family:)", poison, perl = TRUE))[[1]])
family <- append(family, "Agavaceae")

#Convert all the separate lists into a dataframe
df <- data.frame(first_name,other_common_names,scientific_names,family)

#Clean the newly created dataframe for any issues and remove them
for (index in seq(1:415)){
  df[index, 3] <- sub("Scienti???c Names:","",df[index,3])
  df[index, 3] <- sub("Scienti???cNames:","",df[index,3])
}


for (i in seq(1:4)){
  
  for (j in seq(1:415)){
    
    #Remove any extra spacings
    df[j,i] <- trimws(df[j,i])
  }
}

for (i in 1:nrow(df)){
  
  #Change empty data cells to None
  if (df[i,2] == ""){
    df[i,2] <- "None"
  }
  
}

#Finalise and export as csv file.
names(df) <- c("Common Name","Aliases","Scientific Name","Family")
write.csv(df,file = "Toxic Plant List.csv", row.names = FALSE, fileEncoding="UTF-8")

