#Creating plot1.png

#Setting the working directory
setwd("C:/Users/hornec/Desktop/Coursera/4 - Exploratory Data Analysis/Week 1/Project 1")

#Reading the raw dataset
dataset <- read.table(file="./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

#Setting the date parameters and the subsequent data subset 
datasubset <- subset(x = dataset, Date == "1/2/2007" | Date == "2/2/2007")
png(filename="plot1.png", width=480, height=480)

#Labeling the histogram appropriately
hist(datasubset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()




