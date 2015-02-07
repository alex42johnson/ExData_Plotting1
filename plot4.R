#Read the data into a data frame. the .txt file
#is downloaded and unzipped from the below url:
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
tmp <- read.csv("household_power_consumption.txt", sep=";")

#get only the dates we care about
data <- subset(tmp, tmp$Date %in% c("1/2/2007","2/2/2007"))

#convert the "Global Active Power" column into a numeric column for manipulation
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#combine the Date & Time columns into a single 'Timestamp' column.
day <- paste(data$Date, data$Time, sep="")
day <- strptime(day, format = "%d/%m/%Y %H:%M:%S")
data$Timestamp <- day

#prepare the graphics device for 2x2=4 plots
par(mfrow=c(2,2))

#plot 1
plot(data$Timestamp, data$Global_active_power, type='l', xlab='', ylab="Global Active Power (kilowatts)")

#plot 2
plot(data$Timestamp, data$Voltage, type='l', ylab="Voltage", xlab="datetime")

#plot 3
plot(data$Timestamp, data$Sub_metering_1, type='l', xlab='', ylab="Energy sub metering")
lines(data$Timestamp, data$Sub_metering_2, type='l', col="red")
lines(data$Timestamp, data$Sub_metering_3, type='l', col="blue")
#legend for plot 3
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),text.col=c('black','red','blue'), lty=1)

#plot 4
plot(data$Timestamp, data$Global_reactive_power, type='l', ylab="Global_reactive_power", xlab="datetime")

#save the plot (of 4 plots) to a file.
dev.copy(png, 'plot4.png')
dev.off()