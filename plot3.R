function plot3(){
     filename <- "household_power_consumption.txt"
     data <- read.csv (filename, sep=";", nrows=69574)
     data <- data[,c("Date", "Time", "Sub_metering_1","Sub_metering_2","Sub_metering_3")]
     data <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-02" | as.Date(data$Date, "%d/%m/%Y") == "2007-02-01",]
     data$CombDate <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
     
     s1<- as.numeric(as.character(data$Sub_metering_1))
     s2<- as.numeric(as.character(data$Sub_metering_2))
     s3<- as.numeric(as.character(data$Sub_metering_3))
     
     png(filename="plot3.png")
     plot (data$CombDate, s1, type="l", col="black", ylab="Energy sub metering", xlab="" )
     points (data$CombDate, s2, type="l", col="red")
     points(data$CombDate, s3, type="l", col="blue")
     legend("topright", lty=1, col = c("black", "red", "blue"), legend = c( "Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     dev.off()
}