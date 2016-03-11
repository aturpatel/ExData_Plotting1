#Read in data and subset out the only 2 dates we want: Feb 1 2007 and Feb 2 2007
data<-read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
data<-subset(data, Date=="1/2/2007" | Date=="2/2/2007")

#Set dates and times
library(lubridate)
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)

#Plot graphs in a 2x2 arrangement
png(file="plot4.png")
par(mfrow=c(2,2))

#Plot Global Active power vs DateTime
with(data, plot(Date+Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowats)"))

#Plot Voltage vs DateTime
with(data, plot(Date+Time, Voltage, type="l", xlab="datetime"))

#Plot Energy Sub Metering vs DateTime
with(data, plot(Date+Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(Date+Time, Sub_metering_2, col="red"))
with(data, lines(Date+Time, Sub_metering_3, col="blue"))
legend("topright", legend=names(data)[7:9], col=c("black", "red", "blue"), lty=1) 

#Plot global_reactive_power vs DateTime
with(data, plot(Date+Time, Global_reactive_power, type="l", xlab="datetime"))

dev.off()