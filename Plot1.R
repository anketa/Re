#Reading data
tab5rows <- read.csv("household_power_consumption.txt", header = TRUE, nrows = 5, sep=";",na.strings="?")
classes <- sapply(tab5rows, class)
tabAll <- read.csv("household_power_consumption.txt", header = TRUE, sep=";",na.strings="?", colClasses = classes)
#Subsetting data + Defining date column
x <- subset(tabAll,tabAll[,1]=="1/2/2007" | tabAll[,1]=="2/2/2007")
x[,1]=as.POSIXct(strptime(paste(as.character(x[,1]),as.character(x[,2])), "%d/%m/%Y %H:%M:%S"))
#Plot 1
png("plot1.png",480,480)
with(x,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global active power(kilowatts)"))
dev.off()
