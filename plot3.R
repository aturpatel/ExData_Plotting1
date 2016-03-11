#Read in data and subset out the only 2 dates we want: Feb 1 2007 and Feb 2 2007
data<-read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
data<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

#Plot graph
png(file="plot3.png")
library(lubridate)
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)
with(data, plot(Date+Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(Date+Time, Sub_metering_2, col="red"))
with(data, lines(Date+Time, Sub_metering_3, col="blue"))
legend("topright", legend=names(data)[7:9], col=c("black", "red", "blue"), lty=1) 
dev.off()