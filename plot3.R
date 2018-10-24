# --------------------------------------------------------------------------
# Coursera Exploratory Data Analysis - Week1 Project 1 - Plot 3
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
sub.metering.1 <- as.numeric(dfHP$Sub_metering_1)
sub.metering.2 <- as.numeric(dfHP$Sub_metering_2)
sub.metering.3 <- as.numeric(dfHP$Sub_metering_3)

# plot the chart
png("./ExData_Plotting1/plot3.png", width=480, height=480)
plot(datetime, sub.metering.1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub.metering.2, type="l", col="red")
lines(datetime, sub.metering.3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, lty=, col=c("black", "red", "blue"), bty="o")

dev.off()


