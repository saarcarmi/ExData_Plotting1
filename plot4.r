function plot4(){
     filename <- "household_power_consumption.txt"
     data <- read.csv (filename, sep=";", nrows=69574)
     data <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-02" | as.Date(data$Date, "%d/%m/%Y") == "2007-02-01",]
     data$CombDate <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
     
     active<- as.numeric(as.character(data$Global_active_power))
     reactive<- as.numeric(as.character(data$Global_reactive_power))
     voltage <- as.numeric(as.character(data$Voltage))
     s1<- as.numeric(as.character(data$Sub_metering_1))
     s2<- as.numeric(as.character(data$Sub_metering_2))
     s3<- as.numeric(as.character(data$Sub_metering_3))
     
     png(filename="plot4.png")
     
     par(mfcol=c(2,2))
     
     
     #Draw top left - Global Active Power / Time
     plot(data$CombDate,active, type="l", xlab="", ylab="Global Active Power (kilowatts)")
     
     #Draw bottom left - Sub Metering / Time
     plot (data$CombDate, s1, type="l", col="black", ylab="Energy sub metering", xlab="" )
     points (data$CombDate, s2, type="l", col="red")
     points(data$CombDate, s3, type="l", col="blue")
     legend("topright", lty=1, col = c("black", "red", "blue"), legend = c( "Sub_metering_1","Sub_metering_2","Sub_metering_3"))

     #Draw top right - Voltage / Time
     plot(data$CombDate,voltage, type="l", xlab="datetime", ylab="Voltage")
     
     #Draw bottom right - Global Re-Active Power / Time
     plot(data$CombDate,reactive, type="l", xlab="datetime", ylab="Global_reactive_power")
     
     dev.off()
}

