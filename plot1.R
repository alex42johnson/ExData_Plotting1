#Read the data into a data frame. the .txt file
#is downloaded and unzipped from the below url:
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
tmp <- read.csv("household_power_consumption.txt", sep=";")

#get only the dates we care about
data <- subset(tmp, tmp$Date %in% c("1/2/2007","2/2/2007"))

#create a histogram with the specified properties
hist(as.numeric(as.character(data$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#save the plotted histogram to a file.
dev.copy(png, 'plot1.png')
dev.off()