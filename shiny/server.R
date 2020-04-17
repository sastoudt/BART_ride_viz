function(input, output) {
  
  bart <- read_csv("../data/date-hour-soo-dest-2020.csv", col_names=F)
  names(bart)=c("date","hour","from", "to","count")
  
  stationIncome = read.csv("../data/stationIncomeNice.csv", stringsAsFactors = F)
  
  output$main_plot1 <- renderPlot({
    bartT = bart %>% group_by(date, from, to) %>% summarise(total = sum(count))
    
    bartT$date=as.Date(as.character(bartT$date))
    
    test = subset(bartT,date==input$date1 & from ==input$station)
    #test = subset(bartT, date=="2020-02-20" & from =="CAST")
    test$from = as.character(test$from)
    test$to=as.character(test$to)
    
    test = merge(test, stationIncome, by.x="to", by.y="stationName", all.x=T, all.y=F)
  
    test$col <- heat.colors(10,rev = T)[as.numeric(cut(log(test$total),breaks = 10))]
    
    test$col2 <- terrain.colors(10,rev = T)[as.numeric(cut(log(test$medianHouseholdIncome),breaks = 10))]
    
    start = test[which(test$to==test$from),]
    rest = test[-which(test$to==test$from),]
    rest = rest %>% arrange(desc(total))
    
    test = rbind.data.frame(start, rest)

    test$orderId=1:nrow(test)
    
    stops <- data.frame(name=unique(c(test$from, test$to)))
    relations <- test[,-2] ## remove date
    g <- graph_from_data_frame(relations, directed=TRUE, vertices=stops)
    
    
    bart_edges = get.edgelist(g)
    values = get.edge.attribute(g, "col")
    newOrder = get.edge.attribute(g, "orderId")
    total = get.edge.attribute(g,"total")
    incomeColor = get.edge.attribute(g, "col2")
    
    
    arcplot(bart_edges,
            col.arcs = values, ordering=newOrder,lwd.arcs=log(total), main=input$date1, col.labels="black", col.nodes = incomeColor)
    
    
    
    
  })
  
  output$main_plot2 <- renderPlot({
    names(bart)=c("date","hour","from", "to","count")
    bartT = bart %>% group_by(date, from, to) %>% summarise(total = sum(count))
    
    bartT$date=as.Date(as.character(bartT$date))
    
    test = subset(bartT,date==input$date2 & from ==input$station)
    test$from = as.character(test$from)
    test$to=as.character(test$to)
    
    test = merge(test, stationIncome, by.x="to", by.y="stationName", all.x=T, all.y=F)
    
    
    test$col <- heat.colors(10,rev = T)[as.numeric(cut(log(test$total),breaks = 10))]
    
    test$col2 <- terrain.colors(10,rev = T)[as.numeric(cut(log(test$medianHouseholdIncome),breaks = 10))]
    
    start = test[which(test$to==test$from),]
    rest = test[-which(test$to==test$from),]
    rest = rest %>% arrange(desc(total))
    
    test = rbind.data.frame(start, rest)
    
    test$orderId=1:nrow(test)
    
    stops <- data.frame(name=unique(c(test$from, test$to)))
    relations <- test[,-2] ## remove date
    g <- graph_from_data_frame(relations, directed=TRUE, vertices=stops)
    
    
    bart_edges = get.edgelist(g)
    values = get.edge.attribute(g, "col")
    newOrder = get.edge.attribute(g, "orderId")
    total = get.edge.attribute(g,"total")
    incomeColor = get.edge.attribute(g, "col2")
    
    
    arcplot(bart_edges,
            col.arcs = values, ordering=newOrder,lwd.arcs=log(total), main=input$date2, col.labels="black", col.nodes = incomeColor)
    
    
    
    
  })
}