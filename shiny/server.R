function(input, output) {
  
  bart <- read_csv("../data/date-hour-soo-dest-2020.csv", col_names=F)
  names(bart)=c("date","hour","from", "to","count")
  
  output$main_plot1 <- renderPlot({
    names(bart)=c("date","hour","from", "to","count")
    bartT = bart %>% group_by(date, from, to) %>% summarise(total = sum(count))
    
    bartT$date=as.Date(as.character(bartT$date))
    
    test = subset(bartT,date==input$date1 & from ==input$station)
    test$from = as.character(test$from)
    test$to=as.character(test$to)
    
  
    test$col <- heat.colors(10,rev = T)[as.numeric(cut(log(test$total),breaks = 10))]
    

    
    test = test %>% arrange(desc(total))
    test$orderId=1:nrow(test)
    
    stops <- data.frame(name=unique(c(test$from, test$to)))
    relations <- test[,-1]
    g <- graph_from_data_frame(relations, directed=TRUE, vertices=stops)
    
    
    bart_edges = get.edgelist(g)
    values = get.edge.attribute(g, "col")
    newOrder = get.edge.attribute(g, "orderId")
    total = get.edge.attribute(g,"total")
    
    
    arcplot(bart_edges,
            col.arcs = values, ordering=newOrder,lwd.arcs=log(total), main=input$date1, col.labels="black")
    
    
    
    
  })
  
  output$main_plot2 <- renderPlot({
    names(bart)=c("date","hour","from", "to","count")
    bartT = bart %>% group_by(date, from, to) %>% summarise(total = sum(count))
    
    bartT$date=as.Date(as.character(bartT$date))
    
    test = subset(bartT,date==input$date2 & from ==input$station)
    test$from = as.character(test$from)
    test$to=as.character(test$to)
    
    
    test$col <- heat.colors(10,rev = T)[as.numeric(cut(log(test$total),breaks = 10))]
    
    
    
    test = test %>% arrange(desc(total))
    test$orderId=1:nrow(test)
    
    stops <- data.frame(name=unique(c(test$from, test$to)))
    relations <- test[,-1]
    g <- graph_from_data_frame(relations, directed=TRUE, vertices=stops)
    
    
    bart_edges = get.edgelist(g)
    values = get.edge.attribute(g, "col")
    newOrder = get.edge.attribute(g, "orderId")
    total = get.edge.attribute(g,"total")
    
    
    arcplot(bart_edges,
            col.arcs = values, ordering=newOrder,lwd.arcs=log(total), main=input$date2, col.labels="black")
    
    
    
    
  })
}