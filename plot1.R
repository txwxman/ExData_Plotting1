##read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", colClasses = "character")

##convert date field from character to Date
data[, 1] <- as.Date(data[, 1], format="%d/%m/%Y")

##select subset of 1-2 February 2007
data_2days <- data[(data[, 1] == as.Date("2007-02-01")) | (data[ , 1] == as.Date("2007-02-02")), ]

##convert value to be plotted from character to numeric
data_2days[ , 3] <- as.numeric(data_2days[ , 3])

##generate histogram to png file
png(file = "plot1.png") 
hist(data_2days[, 3], main="Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()