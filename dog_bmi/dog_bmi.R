rm(list=ls())

data = read.csv('AKC Breed Info.csv', header = TRUE)

head(data)

data$height_low_inches <- data$height_low_inches * 0.0254
data$height_high_inches <- data$height_high_inches * 0.0254
data$weight_low_lbs <- data$weight_low_lbs * 0.453592
data$weight_high_lbs <- data$weight_high_lbs * 0.453592
colnames(data) <- c('Breed','height_low_m','height_high_m','weight_low_kg','weight_high_kg')
data$height_avg = (data$height_low_m + data$height_high_m)/2
data$weight_avg = (data$weight_low_kg + data$weight_high_kg)/2
data$bmi_low = (data$weight_low_kg / data$height_low_m^2)
data$bmi_avg = (data$weight_avg / data$height_avg^2)
data$bmi_high = (data$weight_high_kg / data$height_high_m^2)
