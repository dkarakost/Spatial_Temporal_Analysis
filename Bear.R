# install packages 
if (!"sf" %in% installed.packages()){install.packages("sf")}
if (!"MASS" %in% installed.packages()){install.packages("MASS")}
if (!"rpart" %in% installed.packages()){install.packages("rpart")}
if (!"terra" %in% installed.packages()){install.packages("terra")}

# load the libraries 
library("terra")
library("sf")
library("MASS")
library("rpart")

#define the projection 
CRS_LOCAL <- "epsg:3021"

#set working directory 
setwd("C:/Users/dimitrios/Desktop/Spatial_Temporal_Analysis")

#load the trajectory points 
load("mating2009.Rdata")

#inspect the dataset 
head(mating2009)

str(mating2009)

###### DATA CLEANING AND EXPLORATION #######

# For each bear 
print(typeof(mating2009$LMT_date))

#change it to POSIXct with as.POSIXct()
mating2009$LMT_date <-as.POSIXct(mating2009$LMT_date,format="%d-%m-%Y %H:%M:%S", tz = 'UTC')

print(typeof(mating2009$LMT_date))

#create a vector with the unique bear names and sort it.

bearnames <- unique(mating2009$Name)

bearnames<- sort(bearnames, decreasing = FALSE)

head(bearnames)