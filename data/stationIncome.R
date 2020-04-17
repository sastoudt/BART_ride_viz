
#https://data.census.gov/cedsci/table?q=S1903&g=0400000US06.060000&tid=ACSST5Y2018.S1903&hidePreview=true&moe=false
acsIncome = read_csv("../data/ACSST5Y2018.S1903_data_with_overlays_2020-04-17T133627.csv")


medianHouseholdIncome = which(names(acsIncome)=="S1903_C01_001E") ## median household income overall


incomeData = acsIncome[,c(2, medianHouseholdIncome)]


write.csv(incomeData,"../data/incomeData.csv",row.names=F)


stations = c("12TH", "16TH", "19TH", "24TH", "ANTC", "ASHB", "BALB", "BAYF", "CAST", "CIVC", "COLM", "COLS", "CONC", "DALY" ,"DBRK",
             "DELN", "DUBL", "EMBR", "FRMT", "FTVL", "GLEN", "HAYW", "LAFY", "LAKE", "MCAR", "MLBR", "MONT", "NBRK", "NCON" ,"OAKL",
             "ORIN", "PCTR", "PHIL", "PITT", "PLZA", "POWL", "RICH", "ROCK", "SANL", "SBRN", "SFIA", "SHAY", "SSAN", "UCTY", "WARM",
             "WCRK", "WDUB", "WOAK", "BERY", "MLPT")

#write.csv(stations, "../data/stations.csv", row.names=F) ## manually pair up

stations=read_csv("../data/stations.csv") ## after manually paired
names(stations)=c("stationName","geography")

head(incomeData)

incomeData=incomeData[2:nrow(incomeData),]

names(incomeData)=c("geography","medianHouseholdIncome")

stationPlus = merge(stations, incomeData, by.x="geography", by.y="geography", all.x=T,all.y=F)

write.csv(stationPlus,"../data/stationIncomeNice.csv",row.names=F)
