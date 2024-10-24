library(ggplot2)
library(dplyr)
# 1. Import manually scraped datasets
fever <- read.csv('WNBA Teams Stats - Indiana Fever.csv')
aces <- read.csv('WNBA Teams Stats - Las Vegas Aces.csv')
liberty <- read.csv('WNBA Teams Stats - New York Liberty.csv')
# Combine datasets
fever <- mutate(fever, Team= "fever")
aces <- mutate(aces, Team= "aces")
liberty <- mutate(liberty, Team= "liberty")
wnba<- bind_rows(fever, aces, liberty)

# 2. Graph of the distribution of number of 3-pointers made by each of the players from your chosen 3 teams
ggplot(wnba) + geom_histogram(aes(x=X3P), binwidth=7, col='black', fill='dark green') + 
  labs(title= "Number of 3-Pointers of All 3 Teams", x= "Number of 3-Pointers", y= "Frequency") + theme_classic()

#3 Graph of relationship between minutes played and total rebound with random player highlighted and labeled.
set.seed(5)
rand_wnba <- wnba[sample(nrow(wnba), size=1), ]
ggplot(wnba, aes(x=MP,y=TRB)) + geom_point(color = "darkgray") + geom_point(data= rand_wnba, color = "maroon") + 
  theme_classic() + labs(title= "Minutes Played vs. Total Rebounds", x="Minutes Played", y="Total Rebounds") + 
  annotate(geom= "text", x=rand_wnba$MP + 20, y=rand_wnba$TRB + 30 , label=rand_wnba$Player, color="maroon")
