#Creating plot4.png

#Setting the working directory
setwd("C:/Users/hornec/Desktop/Coursera/4 - Exploratory Data Analysis/Week 1/Project 1")

#Loading the dataset into R
dataset <- read.table(file="./household_power_consumption.txt", sep=";", header=T, na.strings="?")

#Subsetting the dataset for the desired interval and creating the timeseries
datasubset <- subset(x = dataset, Date == "1/2/2007" | Date == "2/2/2007")
datasubset$dateTime <- as.POSIXct(strptime(paste(datasubset$Date, datasubset$Time), "%d/%m/%Y %H:%M:%S"))

#Plotting and combining the 4 plots into 1 with correct labels in the correct order
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data=datasubset, Global_active_power ~ dateTime, type="l", ylab = "Global Active Power", xlab=NA)
plot(data=datasubset, Voltage ~ dateTime, type="l", xlab="datetime")
plot(data=datasubset, Sub_metering_1 ~ dateTime, type="n", ylab = "Energy sub metering", xlab=NA)
points(data=datasubset, Sub_metering_1 ~ dateTime, type="l", col="black")
points(data=datasubset, Sub_metering_2 ~ dateTime, type="l", col="red")
points(data=datasubset, Sub_metering_3 ~ dateTime, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, lty=c(1,1,1), bty="n")
plot(data=datasubset, Global_reactive_power ~ dateTime, type="l", xlab="datetime")
dev.off()