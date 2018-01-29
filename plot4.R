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

#Plot4
par(mfrow = c(2,2))
#a
plot(b$Time,b$Global_active_power,xlab="",ylab="Global Active Power", type="l")
#b
plot(b$Time,b$Voltage, type = 'l', ylab = "Voltage", xlab = "datetime")
#c
with(b,{
  plot(b$Time,b$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(b,lines(Time, Sub_metering_1))
  with(b,lines(Time, Sub_metering_2,col="red"))
  with(b,lines(Time, Sub_metering_3,col="blue"))
  legend("topright", lty = 1, col = c("black", "red", "green"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), box.lty=0, cex = 0.5)
  box(lwd=1) 
})
#d
plot(b$Time,b$Global_reactive_power,xlab="datetime",ylab= "Global_reactive_power", type="l")
dev.copy(png, file = "plot4.png")
dev.off()