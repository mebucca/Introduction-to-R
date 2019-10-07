
################################################## Preamble #################################################


# Clear Screen 
cat("\014")
rm(list = ls())


# Load Packages 
library("tidyverse")
library("modelr")
library("readstata13")
library("ggsci")
library("cowplot")
library("stargazer")

############################################# Setting directories ############################################


# Change the line below to set your own working directory

folder <- "/Users/Mauricio/Library/Mobile Documents/com~apple~CloudDocs/Teaching/EUI/Introduction to Quantitative Methods/IntroR/"

dircode       <- paste0(folder,"code/") 
dirdata 	  <- paste0(folder,"data/") 
dirresults    <- paste0(folder,"results/");  dirresults


############################################### Input data ################################################### 


# Set working directory
setwd(dirdata)
getwd()

essdata <- read.dta13("ESS8_subset.dta", convert.factors=FALSE); essdata


############################################ Data exploration ################################################


# Call another R script containg some analyses. 
#Organizing the work in this ways allows for more readable and tractable code.



# Set working directory
setwd(dircode)

source("2_exploration.R")


############################################ Data analysis ################################################


# Set working directory
setwd(dircode)

source("3_analyses.R")
