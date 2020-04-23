# Load Data

datafile <- "household_power_consumption.txt"
source('readdata.R')
library(data.table)
data <- readdata(datafile, startdate = "2007-02-01", enddate ="2007-02-02")

## Plot 1
# A histogram showing frequency of Global Active Power (kW) values

# Open PNG file
png("plot1.png", width=480, height=480)

# Plotting specs

hist(  data[, Global_active_power]
     , main="Global Active Power"
     , xlab="Global Active Power (kilowatts)"
     , ylab="Frequency"
     , col="Red"
     )

# Close PNG file

dev.off()