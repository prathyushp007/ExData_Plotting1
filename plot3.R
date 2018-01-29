# Initialization 
plot.new()
dev.off()
rm(list = ls())

# Read and Datatype Definitions/Conversions for all Plots - Onetime Exercise
a <- read.table("household_power_consumption.txt", sep =";", header = TRUE)
head(a)
a$Time <- paste(a$Date, a$Time)
a$Time <- as.POSIXct(a$Time, format="%d/%m/%Y %H:%M:%S")
a$Date <- as.Date(a$Date, format = "%d/%m/%Y")
a$Global_active_power <- as.numeric(as.character(a$Global_active_power))
a$Global_reactive_power <- as.numeric(as.character(a$Global_reactive_power))
a$Sub_metering_1 <- as.numeric(as.character(a$Sub_metering_1))
a$Sub_metering_2 <- as.numeric(as.character(a$Sub_metering_2))
a$Sub_metering_3 <- as.numeric(as.character(a$Sub_metering_3))

#Subset the Date Range
b <- subset(a, a$Date >= "2007-02-01" & a$Date <= "2007-02-02")
head(b)

#Plot3
plot(b$Time,b$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering", main = "Energy sub metering")
with(b,lines(Time, Sub_metering_1))
with(b,lines(Time, Sub_metering_2,col="red"))
with(b,lines(Time, Sub_metering_3,col="blue"))  
legend("topright", lty = 1, col = c("black", "red", "green"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()
