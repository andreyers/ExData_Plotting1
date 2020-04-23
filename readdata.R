readdata <- function (datafile, startdate = "2007-02-01", 
          enddate ="2007-02-02") {
  
# Define data directory and necessary libraries
setwd("C:/Users/andre/Desktop/jhu-datasci/exdata/ExData_Plotting1")
library(data.table)

# Check if data directory exists and if there is data!

if ( !file.exists(datafile) ) {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp) 
  unzip(temp)
  unlink(temp)
}

# Read data into R

hpc <- data.table::fread(  input = datafile
                         , header=TRUE
                         , sep=';'
                         , na.strings="?"
                         , colClasses = c("character","character", rep("numeric",7))
)

# Change date types to appropriate formats

hpc[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Specify date range
data <- hpc[(Date >= startdate) & (Date <= enddate)]

rm(hpc)

# Add a dateTime column for easy datetime extraction
data[, dateTime := as.POSIXct(paste(Date, Time))]
data[, dateTime := as.POSIXct(dateTime, format = "%d/%m/%Y %H:%M:%S")]

# Prevent scientific notation

data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

}
