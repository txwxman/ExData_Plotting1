##read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", colClasses = "character")

##convert date field from character to Date
data[, 1] <- as.Date(data[, 1], format="%d/%m/%Y")

##select subset of 1-2 February 2007
data_2days <- data[(data[, 1] == as.Date("2007-02-01")) | (data[ , 1] == as.Date("2007-02-02")), ]

##convert values to be plotted from character to numeric
data_2days[ , 7] <- as.numeric(data_2days[ , 7])
data_2days[ , 8] <- as.numeric(data_2days[ , 8])
data_2days[ , 9] <- as.numeric(data_2days[ , 9])

##convert time field
data_2days[ , 2] <- as.POSIXct(strptime(paste(as.character(data_2days[ , 1]), data_2days[ , 2]), "%Y-%m-%d %H:%M:%S"))

##plot to png
png(file = "plot3.png")
plot(data_2days[ , 2],data_2days[ , 7], type = 'n', ylab = "Energy sub metering",
     xlab = "")
lines(data_2days[ , 2],data_2days[ , 7])
lines(data_2days[ , 2],data_2days[ , 8], col = "red")
lines(data_2days[ , 2],data_2days[ , 9], col = "blue")
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1",
       "Sub_metering_2", "Sub_metering_3"))
dev.off()