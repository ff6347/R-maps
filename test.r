# fakedata <- c(1,2,3,4,5)
# plot(fakedata)
?png

mydata <- read.table("data.txt", header=TRUE)
mydata
png(filename="out.png")
plot(ACT ~ Year,data=mydata, pch=16)
dev.off()