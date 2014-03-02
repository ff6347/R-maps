# openpaths.R
#
?plot

#
# Use map projections
#
install.packages("scales")
install.packages("mapdata")
install.packages("mapproj")
install.packages("rworldmap")
install.packages("rworldxtra")
install.packages("ggmap")
require(mapproj)
require(maps)
require(rworldmap)

library(mapproj)
library(mapdata)
library(scales)  #for transparency
library(rworldmap)

 # vignette('rworldmap')


# map("world","Germany",xlim=c(0,-20), ylim=c( 50,30), col="gray90", fill=TRUE)

routes <- read.csv("openpathslearning.csv", stringsAsFactors=FALSE)
routes[1:10,]

# Basic points plot
# plot(routes$lat, routes$lon, type="n")
# points(routes$lat, routes$lon, pch=20, cex=0.3)
# lines(routes$lat, routes$lon)


# Albers projection
locProj <- mapproject(routes$lat, routes$lon, "mercator")
routes$latproj <- locProj$x
routes$lonproj <- locProj$y

# Map the projected points
plot(routes$latproj, routes$lonproj,type="n", asp=1, axes=FALSE, xlab="", ylab="")

points(locProj$lat, locProj$lon, pch=20, cex=0.3)
lines(locProj$latproj, locProj$lonproj)

# # sort by date
# sroutes<-routes[order(routes$date),]
# sroutes[1:10,]
# map(database= "world", ylim=c(49,50), xlim=c(9,12), col="grey80", fill=TRUE, projection="mercator" )


# locProj <- mapproject(sroutes$lat, sroutes$lon, projection="mercator",)

# routes$latproj <- locProj$x

# routes$lonproj <- locProj$y

# mapproject(routes$lat, routes$lon, projection="")

# Map the projected points
# for (i in 1:length(routeIds)) {
#   currRoute <- subset(routes, tempid==routeIds[i])
#   lines(currRoute$latproj, currRoute$lonproj)
# }
# map("worldHires","Germany")
# plot(routes$lat, routes$lon,axes=FALSE,col=alpha("black", 0.6))

# points(routes$lon, routes$lat, pch=19, col="red", cex=0.5)



# lon <- c(-72, -66, -107, -154)  #fake longitude vector
# lat <- c(81.7, 64.6, 68.3, 60)  #fake latitude vector
# coord <- mapproject(routes$lat, routes$lon, proj="mercator")  #convert points to projected lat/long
# coord
# points(coord, pch=20, cex=1.2, col="red")  #plot converted points



# library(mapproj)
# map(database= "world", ylim=c(49,50), xlim=c(9,12), col="grey80", fill=TRUE, projection="gilbert" )
# # map(database= "world", ylim=c(45,90), xlim=c(-160,-50), col="grey80", fill=TRUE, projection="gilbert", orientation= c(90,0,225))
# lon <- routes$lon  #fake longitude vector
# lat <- routes$lat  #fake latitude vector
# coord <- mapproject(lon, lat, proj="gilbert", orientation=c(90, 0, 225))  #convert points to projected lat/long
# points(coord, pch=20, cex=1.2, col="red")  #plot converted points

# plot(coord)

