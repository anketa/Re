#Reading data
tab5rows <- read.csv("household_power_consumption.txt", header = TRUE, nrows = 5, sep=";",na.strings="?")
classes <- sapply(tab5rows, class)
tabAll <- read.csv("household_power_consumption.txt", header = TRUE, sep=";",na.strings="?", colClasses = classes)
#Subsetting data + Defining date column
x <- subset(tabAll,tabAll[,1]=="1/2/2007" | tabAll[,1]=="2/2/2007")
x[,1]=as.POSIXct(strptime(paste(as.character(x[,1]),as.character(x[,2])), "%d/%m/%Y %H:%M:%S"))
#Plot 3
png("plot3.png",480,480)
with(x,plot(Date,Sub_metering_1,type="l",ylab="Energy sub metering"))
with(x,lines(Date,Sub_metering_2,type="l",col="red"))
with(x,lines(Date,Sub_metering_3,type="l",col="blue"))
legend("topright",legend=colnames(x)[7:9],lty=c(1,1,1),col=c("black","red","blue"))
dev.off()
