# --------------------------------------------------------------------------
# Coursera Exploratory Data Analysis - Week1 Project 1 - Plot 4
# Author: David Twaddell
# Date: 24th Oct 2018
# --------------------------------------------------------------------------

# code for loading data
fName <- "./ExData_Plotting1/data/household_power_consumption.txt"
dfHP_All <- read.table(fName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dfHP <- dfHP_All[dfHP_All$Date %in% c("1/2/2007","2/2/2007") ,]

# prepare data for plotting
datetime <- strptime(paste(dfHP$Date, dfHP$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global.active.power <- as.numeric(dfHP$Global_active_power)
global.reactive.power <- as.numeric(dfHP$Global_reactive_power)
voltage <- as.numeric(dfHP$Voltage)
sub.metering.1 <- as.numeric(dfHP$Sub_metering_1)
sub.metering.2 <- as.numeric(dfHP$Sub_metering_2)
sub.metering.3 <- as.numeric(dfHP$Sub_metering_3)

# plot the charts in 2 rows and 2 cols
png("./ExData_Plotting1/plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

# 1
plot(datetime, global.active.power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# 2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# 3
plot(datetime, sub.metering.1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub.metering.2, type="l", col="red")
lines(datetime, sub.metering.3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# 4
plot(datetime, global.reactive.power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


