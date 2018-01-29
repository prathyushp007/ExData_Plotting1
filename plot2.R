# Initialization 
plot.new()
dev.off()
rm(list = ls())
library(graphics)

# Read and Datatype Definitions/Conversions for all Plots - Onetime Exercise
a <- read.table("household_power_consumption.txt", sep =";", header = TRUE)
head(a)
a$Time <- paste(a$Date, a$Time)
a$Time <- as.POSIXct(a$Time, format="%d/%m/%Y %H:%M:%S")
a$Date <- as.Date(a$Date, format = "%d/%m/%Y")

#Subset the Date Range
b <- subset(a, a$Date >= "2007-02-01" & a$Date <= "2007-02-02")
head(b)

# Plot2
plot(b$Time,b$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", type="l",main = "Global Active Power VS Time")
dev.copy(png, file = "plot2.png")
dev.off()