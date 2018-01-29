# Initialization 
plot.new()
dev.off()
rm(list = ls())
library(graphics)

# Read and Datatype Definitions/Conversions for all Plots - Onetime Exercise
a <- read.table("household_power_consumption.txt", sep =";", header = TRUE)
head(a)
a$Global_active_power <- as.numeric(as.character(a$Global_active_power))
a$Date <- as.Date(a$Date, format = "%d/%m/%Y")

#Subset the Date Range
b <- subset(a, a$Date >= "2007-02-01" & a$Date <= "2007-02-02")
head(b)

# Plot1
hist(b$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power(killowatts)")
dev.copy(png, file = "plot1.png")
dev.off()