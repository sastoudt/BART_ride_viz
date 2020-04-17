library(dplyr)
library(readr)
library(devtools)
library(arcdiagram)
library(igraph)

#bart <- read_csv("http://64.111.127.166/origin-destination/date-hour-soo-dest-2020.csv.gz",col_names=F)  
#bart <- read_csv("../data/date-hour-soo-dest-2020.csv", col_names=F)
#names(bart)=c("date","hour","from", "to","count")

stations = c("12TH", "16TH", "19TH", "24TH", "ANTC", "ASHB", "BALB", "BAYF", "CAST", "CIVC", "COLM", "COLS", "CONC", "DALY" ,"DBRK",
"DELN", "DUBL", "EMBR", "FRMT", "FTVL", "GLEN", "HAYW", "LAFY", "LAKE", "MCAR", "MLBR", "MONT", "NBRK", "NCON" ,"OAKL",
"ORIN", "PCTR", "PHIL", "PITT", "PLZA", "POWL", "RICH", "ROCK", "SANL", "SBRN", "SFIA", "SHAY", "SSAN", "UCTY", "WARM",
"WCRK", "WDUB", "WOAK", "BERY", "MLPT")



#https://shiny.rstudio.com/gallery/faithful.html
bootstrapPage(
  
  dateInput("date1", 
            h3("Date 1"), 
            value = "2020-01-08", min="2020-01-01", max="2020-04-02"),
  
dateInput("date2", 
          h3("Date 2"), 
          value = "2020-03-18", min="2020-01-01", max="2020-04-02"),

selectInput("station", h3("Select starting station."), selected = "DBRK", stations, multiple = FALSE,
            ),

  
  
  plotOutput(outputId = "main_plot1", height = "300px"),
  
plotOutput(outputId = "main_plot2", height = "300px")
  
)