#Creating plot1.png

#Setting the working directory
Data <-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")
head(Data)

Data$Date <- as.Date(Data$Date, "%d/%m/%Y")

Data <-subset(Data,Date<=as.Date("2007-02-02") & Date>=as.Date("2007-02-01"))

Data <-Data[complete.cases(Data),]
DateTime <-paste(Data$Date,Data$Time)
DateTime <-setNames(DateTime,"DateTime")
Data <-Data[,!(names(Data) %in% c("Date","Time"))]
Data <-cbind(Data,DateTime)
head(Data)
hist(Data$Global_active_power,main="Global Active Power",xlab="Global Active Power(Kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()





