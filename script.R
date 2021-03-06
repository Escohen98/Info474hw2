library(ggplot2)
library(dplyr)
library(readr)
library(GGally)
library(ggpubr)
library(plotly)

dataset <- read.csv('./data/top2018.csv')

cols <- colnames(dataset)
#Removing irrelevant data
cols <- cols[3:16]
#Get numeric columns only (ordinal or quantitative) 
#nominal columns
nom <- c("artists")
#ordinal columns
ord <- c("key", "mode", "time_signature")
#quantitative columns
quant <- cols[!cols %in% ord]
quant <- quant[2:11]

p <- dataset %>% 
  plot_ly(type = 'parcoords', 
          line = list(color = ~artists,
                      colorscale = list(c(0, 'red'), c(0.25, 'yellow'), c(0.5, 'green'), c(0.75, 'magenta'), c(1, 'blue'))),
          dimensions = list(
            list(range = c(0,1),
                 label = 'danceability', values = ~danceability),
            list(range = c(0,1),
                 label = 'energy', values = ~energy),
            list(range = c(0,1),
                 label = 'loudnesst', values = ~loudness),
            list(range = c(0,1),
                 label = 'speechiness', values = ~speechiness),
            list(range = c(0,1),
                 label = 'acousticness', values = ~acousticness),
            list(range = c(0,1),
                 label = 'instrumentalness', values = ~instrumentalness),
            list(range = c(0,1),
                 label = 'liveness', values = ~liveness),
            list(range = c(0,1),
                 label = 'valence', values = ~valence),
            list(range = c(0,1),
                 label = 'tempo', values = ~tempo),
            list(range = c(0,1),
                 label = 'duration_ms', values = ~duration_ms)
          )
        )


print(cols)







#Getting Frequencies

#Nominal Columns
ggplot(dataset, aes(dataset[,nom[1]])) +
  geom_bar(fill = "#0073C2FF") +
  theme_pubclean()
test <- select(dataset, artists)
test %>%
  group_by(artists)
  filter(nrow(artists) > 1)
print(ncol(test))
test <- unclass(summary(dataset["energy"]))
test <- do.call(cbind, lapply(dataset["energy"], summary))
#test <- gsub('[Min., Max., ')
remove <- c('Min.', 'Max.', 'Qu.', '1st', '3rd')
test <- gsub(remove, '', test)
test <- gsub('[Min., Max., Qu., 1st, 3rd]', '', test)
test <- gsub('[^0-9,.]', '', test)
print(test["min"])
#Divide by 10
gdata <- data.fra
for(col in c("energy")) {
  #Column
  col <- "energy"
  cdata = select(dataset, col)
  #groups <- get_summary(cdata[,col])
  #print(groups[1,2:5])
  int <- (max(cdata[col]) - min(cdata[col]))/4
  cdata$quartiles <- Hmisc::cut2(cdata$energy, g=4)
  #gdata <-  with(cdata, cut(energy, 
  #                         breaks=quantile(cdata[col], probs=seq(min(cdata[col]),max(cdata[col]), by=int), na.rm=TRUE), 
   #                        include.lowest=TRUE))
  #gdata <- factor(gdata[col], levels=c("1", "2", "3", "4"))
  ggplot(cdata, aes(quartiles)) +
    geom_bar(fill = "#0073C2FF") +
    theme_pubclean()
  print(gdata)
  #interval <- 
}

#Returns a dataframe containing the results of the summary() function
get_summary <- function (column) {
  do.call(cbind, lapply(column, summary))
}

