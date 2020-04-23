# Load Data

datafile <- "household_power_consumption.txt"
source('readdata.R')
library(data.table)
data <- readdata(datafile)


## Plot 2
# A line plot of Global Active Power over time (Thurs & Fri)

#hpc[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


png("plot2.png", width=480, height=480)

plot(  data[, dateTime]
     , data[, Global_active_power]
     , type ="l"
     , ylab ="Global Active Power (kilowatts)"
     , xlab = ""
     )


dev.off()

