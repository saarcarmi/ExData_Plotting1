function plot2(){
     filename <- "household_power_consumption.txt"
     data <- read.csv (filename, sep=";", nrows=69574)
     data <- data[,c("Date", "Time", "Global_active_power")]
     data <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-02" | as.Date(data$Date, "%d/%m/%Y") == "2007-02-01",]
     data$CombDate <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
     
     k<- as.numeric(as.character(data$Global_active_power))
     
     png(filename="plot2.png")
     plot(data$CombDate,k, type="l", xlab="", ylab="Global Active Power (kilowatts)")
     dev.off()
}