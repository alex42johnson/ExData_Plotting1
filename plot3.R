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

##Plot the Global Active Power data as a function of Timestamp.
plot(data$Timestamp, data$Sub_metering_1, type='l', xlab='', ylab="Energy sub metering")
lines(data$Timestamp, data$Sub_metering_2, type='l', col="red")
lines(data$Timestamp, data$Sub_metering_3, type='l', col="blue")

#Add the specified legend.
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),text.col=c('black','red','blue'), lty=1)

#save the plot to a file.
dev.copy(png, 'plot3.png')
dev.off()