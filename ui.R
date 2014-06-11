require(rCharts)
shinyUI(fluidPage(
  selectInput("select", label = h3("Select box"), 
              choices = team_names, 
              selected = "Liverpool"),
  
  
 
  mainPanel(showOutput("map","Morris"))
))
  