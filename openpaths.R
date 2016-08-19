# openpaths.R

require(maps)
route <- read.csv("openpaths.csv", stringsAsFactors=FALSE)
png(filename="openpaths-map.png",width=1000,height=1000)
 # map(database = "world", regions = ".", exact = FALSE, boundary = TRUE,
 #      interior = TRUE, projection = "", parameters = NULL, orientation = NULL,
 #      fill = FALSE, col = 1, plot = TRUE, add = FALSE, namesonly = FALSE,
 #      xlim = NULL, ylim = NULL, wrap = FALSE, resolution = if(plot) 1 else 0,
 #      type = "l", bg = par("bg"), mar = c(4.1, 4.1, par("mar")[3], 0.1),
 #      myborder = 0.01, ...)

latrange = range(route$lat)
 latrange
minlat = floor(latrange[1])
maxlat = ceiling(latrange[2])

minlat
maxlat

lonrange = range(route$lon)
 lonrange
minlon = floor(lonrange[1])
maxlon = ceiling(lonrange[2])

minlon
maxlon

map('world')
map('world', fill=FALSE, col=1:10 , ylim=c(minlat,maxlat), xlim=c(minlon,maxlon), plot=TRUE,bg="black")
lines(route$lon,route$lat, col="white")
points(route$lon,route$lat, pch=19, col="grey",cex = 1)
points(route$lon,route$lat, pch=19, col="black",cex = 0.5)
dev.off()