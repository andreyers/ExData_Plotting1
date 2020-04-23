# Load Data

datafile <- "household_power_consumption.txt"
source('readdata.R')
library(data.table)
data <- readdata(datafile)

# Plot 4

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Subplot 1,1
# See plot2.R - A line plot of Global Active Power over time (Thurs & Fri)
plot(  data[, dateTime]
       , data[, Global_active_power]
       , type ="l"
       , ylab ="Global Active Power (kilowatts)"
       , xlab = ""
)
# Subplot 1,2
# A line plot of Voltage data over time

plot(  data[, dateTime]
     , data[, Voltage]
     , type="l"
     , xlab="datetime"
     , ylab="Voltage"
     )

# Subplot 2,1
# See plot3.R

plot(  data[, dateTime]
       , data[, Sub_metering_1]
       , type="l"
       , xlab=""
       , ylab="Energy sub metering"
       )
lines(  data[, dateTime]
        , data[, Sub_metering_2]
        , col="red"
        )
lines(  data[, dateTime]
        , data[, Sub_metering_3]
        ,col="blue"
        )
legend(  "topright"
         , col=c("black","red","blue")
         , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
         , lty=c(1,1)
         , lwd=c(1,1)
         )

# Subplot 2,2
# A line plot of Global Reactive Power over time

plot(  data[, dateTime]
     , data[,Global_reactive_power]
     , type="l"
     , xlab="datetime"
     , ylab="Global_reactive_power"
     )

dev.off()

# clean up environment as needed
# rm(list = ls())
