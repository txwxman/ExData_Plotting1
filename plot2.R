##read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", colClasses = "character")

##convert date field from character to Date
data[, 1] <- as.Date(data[, 1], format="%d/%m/%Y")

##select subset of 1-2 February 2007
data_2days <- data[(data[, 1] == as.Date("2007-02-01")) | (data[ , 1] == as.Date("2007-02-02")), ]

##convert value to be plotted from character to numeric
data_2days[ , 3] <- as.numeric(data_2days[ , 3])

##convert time field
data_2days[ , 2] <- as.POSIXct(strptime(paste(as.character(data_2days[ , 1]), data_2days[ , 2]), "%Y-%m-%d %H:%M:%S"))

##plot to png
png(file = "plot2.png")
plot(data_2days[ , 2],data_2days[ , 3], type = 'n', ylab = "Global Active Power (kilowatts)",
     xlab = "")
lines(data_2days[ , 2],data_2days[ , 3])
dev.off()