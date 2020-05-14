library(dplyr)
library(ggplot2)
library(rgdal)

sPath <- getwd() # get path to Script.R file
sPath
sp <- paste0(sPath, "/ShapeFiles") # add folder to path
list.files(sp) # list shape files
csv <- paste0(sPath, "/TaxiData25.csv") # path to data points to plot
df <- read.csv(csv)
shp <- readOGR(dsn = sp, layer = "taxi_zones")
shpTrans <- spTransform(shp, "+init=epsg:4326")

map <- ggplot() + geom_polygon(data = shpTrans, aes(x = long, y = lat, group = group), colour = "black", fill = NA)

mapData <- ggplot(data = df, aes(x = longitude, y = latitude, colour = "red")) +
              geom_point() +
              geom_polygon(data = shpTrans, aes(x = long, y = lat, group = group), colour = "black", fill = NA)
mapData