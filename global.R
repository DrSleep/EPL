## @knitr global.R
## global.R



download.file(http://vk.com/doc3134952_307553914, "~/1.csv")
all_seasons <- read.csv("~/1.csv")
a=all_seasons[order(as.Date(all_seasons$Date, "%d/%m/%Y")),]

team_names=unique(a$HomeTeam)
team_names=team_names[order(team_names)]