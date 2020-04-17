# BART_ride_viz
visualize BART rides over time, change due to COVID

`shiny::runGitHub("BART_ride_viz", "sastoudt", subdir = "shiny")`

## Data

- [Original Income Data, Census County Division](https://data.census.gov/cedsci/table?q=S1903&g=0400000US06.060000&tid=ACSST5Y2018.S1903&hidePreview=true&moe=false)
- station income wrangling in stations.csv, stationIncome.R, incomeData.csv to produce stationIncomeNice.csv
- [BART Usage Data](http://64.111.127.166/origin-destination/date-hour-soo-dest-2020.csv.gz)

## How to Interpret Plots

- Line width: thick to thin (more to less ridership)
- Line Color: red to yellow (more to less ridership)
- Point Color: tan to green (smaller to larger median household income)

## For Context

- [BART Station Abbreviations](https://api.bart.gov/docs/overview/abbrev.aspx)
- [BART Map](https://en.wikipedia.org/wiki/List_of_Bay_Area_Rapid_Transit_stations#/media/File:BART_2019_official_map.svg) 