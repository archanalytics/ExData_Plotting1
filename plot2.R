# --------------------------------------------------------------------------
# Coursera Exploratory Data Analysis - Week1 Project 1 - Plot 2
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

# plot the chart
png("./ExData_Plotting1/plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# switch off the device
dev.off()


