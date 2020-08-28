library(DT)
library(readr)
library(dplyr)
library(gapminder)

# read in my data
bartonella <- read.csv("data/Bartonella Uveitis Data 6-18-04.csv", header = TRUE)

gapminder <- read.csv("data/gapminder_C.csv", header = TRUE)

# modify my data
bartonella<-rename(bartonella,
                   "ID"="TLF_FIU", 
                   "Uveitis"="UV", 
                   "Bartonella titer"="BartTit",
                   "Fleas"="Flea",
                   "Age (yrs)"="Age"
)
bartonella<-select(bartonella,-"AgeCat")

