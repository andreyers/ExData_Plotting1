# Load Data

atafile <- "household_power_consumption.txt"
source('readdata.R')
library(data.table)
data <- readdata(datafile)

## Plot 1
# A histogram showing frequency of Global Active Power (kW) values

png("plot1.png", width=480, height=480)

hist(  data[, Global_active_power]
     , main="Global Active Power"
     , xlab="Global Active Power (kilowatts)"
     , ylab="Frequency"
     , col="Red"
     )

dev.off()