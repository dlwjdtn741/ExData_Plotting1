#plot 3
library("dplyr")
data<-read.delim("household_power_consumption.txt", sep=";")
data$date1<-paste(data$Date, data$Time, sep=" ")
data$Date<-strptime(data$date1, format="%d/%m/%Y %H:%M:%S")
data$Date<-as.POSIXct(data$Date)
data1<- filter(data,Date>=as.POSIXct("2007-02-01", format="%Y-%m-%d") & Date<as.POSIXct("2007-02-03", format="%Y-%m-%d"))


png("plot3", width=480, height=480, units="px")
with(data1, plot(Date, Sub_metering_1, type="n",xlab="",ylab="Energy sub metering", ylim=c(1,38)))
with(data1, points(Date, as.numeric(as.character(Sub_metering_1)), type="l"))
with(data1, points(Date, as.numeric(as.character(Sub_metering_2)), type="l",col="red"))
with(data1, points(Date, as.numeric(as.character(Sub_metering_3)), type="l",col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c("black","red","blue"))
dev.off()