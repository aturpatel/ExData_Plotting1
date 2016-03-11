#Read in data and subset out the only 2 dates we want: Feb 1 2007 and Feb 2 2007
data<-read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
data<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

#Plot graph
png(file="plot1.png")
with(data, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()