rm(list=ls())
library(pdftools)
library(tm)
library(tm)

opinions <- lapply("Toxic Plant List - Dogs _ ASPCA.pdf",pdf_text)

poison <- paste( unlist(opinions), collapse='')
poison <- gsub("Toxic and Non-Toxic Plant List - Dogs\\\r\\\nPlants Toxic to Dogs","",poison)
first_name <- gsub("","", regmatches(poison, gregexpr("(?<=\\\n)[A-Z]{1}.*(?=\\(\\/pet-care)", poison, perl = TRUE))[[1]])

poison <- gsub("(?<=\\\n)[A-Z]{1}.*(?=\\(\\/pet-care)"," ",poison, perl=TRUE)
poison <- gsub("\\(\\/pet-care.*?\\)","",poison)
poison <- gsub("\\\r\\\n","",poison)
other_common_names <- gsub("[\\(\\)]", "", regmatches(poison, gregexpr("\\(.*?\\)", poison))[[1]])
poison <- gsub("\\(.*?\\)","",poison)
scientific_names <- gsub("[\\|\\|]", "", regmatches(poison, gregexpr("\\|.*?\\|", poison))[[1]]) 
poison <- gsub("\\|.*?\\|","",poison)
poison <- gsub("(?<=Family:)\\s+(?=Family:)"," Unknown ",poison,perl=TRUE)
family <- gsub("Family: ","", regmatches(poison, gregexpr("(?<=Family:).*?(?=Family:)", poison, perl = TRUE))[[1]])
family <- append(family, "Agavaceae")

df <- data.frame(first_name,other_common_names,scientific_names,family)

for (index in seq(1:415)){
  df[index, 3] <- sub("Scienti???c Names:","",df[index,3])
  df[index, 3] <- sub("Scienti???cNames:","",df[index,3])
}


for (i in seq(1:4)){
  
  for (j in seq(1:415)){
    
    df[j,i] <- trimws(df[j,i])
  }
}

for (i in 1:nrow(df)){
  
  if (df[i,2] == ""){
    df[i,2] <- "None"
  }
  
}

names(df) <- c("Common Name","Aliases","Scientific Name","Family")
write.csv(df,file = "Toxic Plant List.csv", row.names = FALSE, fileEncoding="UTF-8")

