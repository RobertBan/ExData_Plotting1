#######################################################################################################################
## Exploratory Data Analysis
## Assignment 1, plot 1
## Robert Ban
## 2015-05-09
#######################################################################################################################
## This script reads in the Individual household electric power consumption Data Set filters data so as to keep 
## entries from the 1st and the 2nd of February 2007 only. Then constructs the first plot and saves it to plot1.png
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

## construct and save the first plot
par(mar = c(4, 4, 2, 1), bg="transparent")
hist(df$Global_active_power, freq=TRUE, breaks=12, ylim=c(0,1200), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png") 
dev.off()