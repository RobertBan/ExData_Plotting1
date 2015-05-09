#######################################################################################################################
## Exploratory Data Analysis
## Assignment 1, plot 4
## Robert Ban
## 2015-05-09
#######################################################################################################################
## This script reads in the Individual household electric power consumption Data Set filters data so as to keep 
## entries from the 1st and the 2nd of February 2007 only. Then constructs the fourth plot and saves it to plot4.png
#######################################################################################################################
## read in the data set
df <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
## column conversion
df$Time <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_intensity <- as.numeric(df$Global_intensity)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
## filter data
df <- subset(df, Date %in% c(as.Date("01/02/2007", "%d/%m/%Y"), as.Date("02/02/2007", "%d/%m/%Y")))

## construct and save the fourth plot
par(mfrow = c(2, 2),mar = c(4, 4, 2, 1), bg="transparent")
plot(df$Time, df$Global_active_power, type="l", ylab="Global Active Power", xlab=" ")
plot(df$Time, df$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(df$Time, df$Sub_metering_1, type="n", ylab="Energy sub metering", xlab=" ")
lines(df$Time, df$Sub_metering_1, col="black")
lines(df$Time, df$Sub_metering_2, col="red")
lines(df$Time, df$Sub_metering_3, col="blue")
legend("topright", pch = "—", bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(df$Time, df$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.copy(png, file = "plot4.png") 
dev.off()