filename <- "household_power_consumption.txt"
#read chunk of the file the includes the records we are interested in
data <- read.csv (filename, sep=";", nrows=69574)

#filter by the date -- fine grin filtering of on very specific dates
data <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-02" | as.Date(data$Date, "%d/%m/%Y") == "2007-02-01",]
#Combine the date and time to allow x-axis view
data$CombDate <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#convert some fields to numerics
active<- as.numeric(as.character(data$Global_active_power))
reactive<- as.numeric(as.character(data$Global_reactive_power))
voltage <- as.numeric(as.character(data$Voltage))
s1<- as.numeric(as.character(data$Sub_metering_1))
s2<- as.numeric(as.character(data$Sub_metering_2))
s3<- as.numeric(as.character(data$Sub_metering_3))

#create a png device to create output file
png(filename="plot4.png",width = 480, height = 480)
#get ready to draw 4 graphs (2*2)
par(mfcol=c(2,2))

#Draw top left - Global Active Power / Time
plot(data$CombDate,active, type="l", xlab="", ylab="Global Active Power")

#Draw bottom left - Sub Metering / Time
plot (data$CombDate, s1, type="l", col="black", ylab="Energy sub metering", xlab="" )
points (data$CombDate, s2, type="l", col="red")
points(data$CombDate, s3, type="l", col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c( "Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Draw top right - Voltage / Time
plot(data$CombDate,voltage, type="l", xlab="datetime", ylab="Voltage")

#Draw bottom right - Global Re-Active Power / Time
plot(data$CombDate,reactive, type="l",lwd=0.01 ,xlab="datetime", ylab="Global_reactive_power")

#close device to free resources
dev.off()

#DONE