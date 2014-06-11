
require(rCharts)
shinyServer(function(input, output) {
  
  # You can access the value of the widget with input$select, e.g.
  output$map <- renderChart({ 
    name=input$select
    
    a1=subset(a,HomeTeam==name | AwayTeam==name)
    
    
    k=as.Date(a1$Date[1])
    
    
    
    awayGoals=0;
    homeGoals=0;
    j=1;
    
    #if (a1$HomeTeam[1]==name) {
    #  homeGoals[1]=a1$FTHG[1];
    #}else awayGoals[1]=a1$FTAG[1];
    
    prev_month=as.numeric(substr(a1$Date[1],4,5));
    year=as.numeric(substr(a1$Date[1],7,10))
    
    x <- data.frame(paste(as.character(year),as.character(year+1),sep="-"),0,0,stringsAsFactors=FALSE);
    colnames(x) <- c("Season", "HomeGoals", "AwayGoals")
    if (a1$HomeTeam[1]==name) {
      x$HomeGoals[1]=a1$FTHG[1];
    }else x$AwayGoals[1]=a1$FTAG[1];
    
    for(i in 2:dim(a1)[1])
      
    {
      cur_month=as.numeric(substr(a1$Date[i],4,5));
      
      if (cur_month==8 & prev_month==5) {
        j=j+1; 
        
        year=as.numeric(substr(a1$Date[i],7,10))
        #new_row=c(paste(as.character(year),as.character(year+1),sep="-"),0,0);
        #x=rbind(x,new_row)
        x[j,1]=paste(as.character(year),as.character(year+1),sep="-");
        x[j,2]=0;
        x[j,3]=0;
      }
      
      if (a1$HomeTeam[i]==name) {
        x$HomeGoals[j]=x$HomeGoals[j]+a1$FTHG[i];
      }else{
        x$AwayGoals[j]=x$AwayGoals[j]+a1$FTAG[i];}
      
      
      
      
      prev_month=cur_month;
    }
    x1 <- transform(x, Season = as.character(Season))
    
    
    
    m2 <- mPlot(x = "Season", y = c("HomeGoals", "AwayGoals"), type = "Line", data = x1)
    m2$set(parseTime = FALSE)
    
    m2$set(title = 'EPL', dom = 'map')
    return (m2) })
  
})
