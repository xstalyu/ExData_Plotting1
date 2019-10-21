#Creating plot2.png

#Setting the working directory
setwd("C:/Users/hornec/Desktop/Coursera/4 - Exploratory Data Analysis/Week 1/Project 1")

#Reading the data set in R and using the appropriate date notation
dataset <- read.table("./household_power_consumption.txt", sep=";", header = T)
dataset$Date = as.Date(dataset$Date, "%d/%m/%Y")
dataset$Global_active_power = as.numeric(dataset$Global_active_power)

#Subsetting the data for the required time range
datasubset1 = subset(dataset, Date == "2007-02-01")
datasubset2 = subset(dataset, Date == "2007-02-02")
datasubsets = rbind(datasubset1, datasubset2)

#Amalgamating date and time for both subset1 & subset2 (ie:subsets)
datetime = paste(datasubsets$Date, datasubsets$Time)
datasubsets$DateTime = strptime(datetime, "%Y-%m-%d %H:%M:%S")

#Plotting the second plot with the appropriate labels 
png(filename = "plot2.png", width = 480, height = 480)
plot(data=datasubset, Global_active_power ~ dateTime, type="l", ylab = "Global Active Power", xlab=NA)
dev.off()





