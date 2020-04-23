# Load Data

datafile <- "household_power_consumption.txt"
source('readdata.R')
library(data.table)
data <- readdata(datafile)

# Plot 3
# A line plot of submetering data (1,2, & 3) over time (Thurs & Fri) 

png("plot3.png", width=480, height=480)

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

dev.off()