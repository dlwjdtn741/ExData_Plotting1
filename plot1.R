#plot 1
library("dplyr")
data<-read.delim("household_power_consumption.txt", sep=";")
data$Date<-strptime(data$Date, format="%d/%m/%Y")
data$Date<- as.Date(data$Date, "%Y-%m-%d")
data1<- filter(data,Date>="2007-02-01" & Date<="2007-02-02")

png("plot1", width=480, height=480, units= "px")
hist(as.numeric(as.character(data1$Global_active_power)), xlab="Global Active Power (kilowatts)", col="red", freq=TRUE, main="Global Active Power")
dev.off()
