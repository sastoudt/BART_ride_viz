library(dplyr)
library(readr)
library(devtools)
library(arcdiagram)
library(igraph)

#bart <- read_csv("http://64.111.127.166/origin-destination/date-hour-soo-dest-2020.csv.gz",col_names=F)  
bart <- read_csv("../data/date-hour-soo-dest-2020.csv", col_names=F)
names(bart)=c("date","hour","from", "to","count")



#https://shiny.rstudio.com/gallery/faithful.html
bootstrapPage(
  
  dateInput("date1", 
            h3("Date 1"), 
            value = "2020-01-08"),
  
dateInput("date2", 
          h3("Date 2"), 
          value = "2020-03-18"),

selectInput("station", h3("Select starting station."), selected = "DBRK", unique(bart$from), multiple = FALSE,
            ),

  
  
  plotOutput(outputId = "main_plot1", height = "300px"),
  
plotOutput(outputId = "main_plot2", height = "300px")
  
)