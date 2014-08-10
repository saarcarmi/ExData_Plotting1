function plot1(){
     filename <- "household_power_consumption.txt"
     data <- read.csv (filename, sep=";", nrows=69574)
     data$Date = as.Date(data$Date, "%d/%m/%Y")
     d <- data[data$Date == "2007-02-02" | data$Date == "2007-02-01",]
     
     k<- as.numeric(as.character(d$Global_active_power))
     png(filename="plot1.png")
     hist(k, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
     #dev.copy (png, "plot1.png")he  
     dev.off()
}