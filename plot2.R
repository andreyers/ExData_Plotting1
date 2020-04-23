# Load Data

datafile <- "household_power_consumption.txt"
source('readdata.R')
library(data.table)
data <- readdata(datafile, startdate = "2007-02-01", enddate ="2007-02-02")


## Plot 2
# A line plot of Global Active Power over time (Thurs & Fri)

# Open PNG file

png("plot2.png", width=480, height=480)

# Plotting specs

plot(  data[, dateTime]
     , data[, Global_active_power]
     , type ="l"
     , ylab ="Global Active Power (kilowatts)"
     , xlab = ""
     )

# Close PNG file

dev.off()

