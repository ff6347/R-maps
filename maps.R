# maps.R
# ?plot
# install.packages("rworldmap")
# install.packages("rworldxtra")

# ?rworldmap
# vignette('rworldmap')

require(rworldmap)
require(rworldxtra)
routes <- read.csv("openpaths.csv", stringsAsFactors=FALSE)
routes[1:10,]

# png(filename="map.png",width=3600,height=1800)
newmap <- getMap(resolution = "high")
plot(newmap, xlim = c(10, 13), ylim = c(50, 55), type="l",asp = 1)

points(routes$lon, routes$lat, col = "green", cex = .6)
lines(routes$lon, routes$lat, col = "black")

# dev.off()