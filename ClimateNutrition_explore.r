###################################################
# Exploration of climate, non-climate and nutrition variables
# Written on Jul 2019 by Á.G. Munoz (IRI/Earth Institute at CU. - agmunoz@iri.columbia.edu) 
# Last update: Aug 16th, 2019
# Citation: Gonzalez-Romero et al (in prep.)
# Notes: part of the ACToday activities in Guatemala
# Use: target users are researchers at SESAN
# 
################################################
closeAllConnections()
rm(list=ls())
#Go to your working directory
#Ir al directorio
setwd('/Users/agmunoz/Documents/Angel/Publics/Guatemala_ClimateNutrition_GonzalezRomeroetal/')
# Load the packages:
library(ggplot2)
theme_set(theme_minimal())
library(lubridate)

#A function to read month and year:
my <- function (..., quiet = FALSE, tz = NULL, locale = Sys.getlocale("LC_TIME")) {
  lubridate:::.parse_xxx(..., orders = "my", quiet = quiet, tz = tz, locale = locale, 
                         truncated = 0)
}

#Read data
Data <- read.csv(file="Dataset_climatenutrition.csv", header=TRUE, sep=",")
#mydate <- as.Date(as.character(Data[[1]]),format = "%m-%Y")
Data[[1]] <- my(as.character(Data[[1]]))  #read the dates the right way!

#Plots
  #Timeseries:
  ggplot()+geom_line(data = Data, aes(x = Date, y = Cases),color = "blue", size = 2) +
    geom_line(data = Data, aes(x = Date, y = Rainfall),color = "red", size = 2) + 
    xlab('date') +
    ylab('cases (blue) and rainfall (red)')

  #Lag-correlation analysis
  ccf(Data[[2]], Data[[3]], xlab='Lag (months)',ylab='Cross-correlation Function',main='')
