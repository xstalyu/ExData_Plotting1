#Creating plot3.png

#Setting the working directory
setwd("C:/Users/hornec/Desktop/Coursera/4 - Exploratory Data Analysis/Week 1/Project 1")

#Reading the data into R
dataset <- read.table(file="./household_power_consumption.txt", sep=";", header=T, na.strings="?")

#Subsetting the data for the appropriate data interval and creating the timeseries
datasubset <- subset(x = dataset, Date == "1/2/2007" | Date == "2/2/2007")
datasubset$dateTime <- as.POSIXct(strptime(paste(datasubset$Date, datasubset$Time), "%d/%m/%Y %H:%M:%S"))

#Plotting the data while replicating the desired labels, colors, etc...
png(filename="plot3.png", width=480, height=480)
plot(data=datasubset, Sub_metering_1 ~ dateTime, type="n", ylab = "Energy sub metering", xlab=NA)
points(data=datasubset, Sub_metering_1 ~ dateTime, type="l", col="black")
points(data=datasubset, Sub_metering_2 ~ dateTime, type="l", col="red")
points(data=datasubset, Sub_metering_3 ~ dateTime, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, lty=c(1,1,1))
dev.off()