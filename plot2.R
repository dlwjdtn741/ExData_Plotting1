#plot 2
library("dplyr")
data<-read.delim("household_power_consumption.txt", sep=";")
data$date1<-paste(data$Date, data$Time, sep=" ")
data$Date<-strptime(data$date1, format="%d/%m/%Y %H:%M:%S")
data$Date<-as.POSIXct(data$Date)
data1<- filter(data,Date>=as.POSIXct("2007-02-01", format="%Y-%m-%d") & Date<as.POSIXct("2007-02-03", format="%Y-%m-%d"))

png("plot2.png", width=480, height=480, units="px")
plot(data1$Date, as.numeric(as.character(data1$Global_active_power)), type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
