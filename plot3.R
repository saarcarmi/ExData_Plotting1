filename <- "household_power_consumption.txt"
#read chunk of the file the includes the records we are interested in
data <- read.csv (filename, sep=";", nrows=69574)

#filter by the date -- fine grin filtering of on very specific dates
data <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-02" | as.Date(data$Date, "%d/%m/%Y") == "2007-02-01",]
#Combine the date and time to allow x-axis view
data$CombDate <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#convert some fields to numerics
s1<- as.numeric(as.character(data$Sub_metering_1))
s2<- as.numeric(as.character(data$Sub_metering_2))
s3<- as.numeric(as.character(data$Sub_metering_3))

#create a png device to create output file
png(filename="plot3.png",width = 480, height = 480)
#plot submetering 1 and add the points of sub-2 and sub-3 on top of it
plot (data$CombDate, s1, type="l", col="black", ylab="Energy sub metering", xlab="" )
points (data$CombDate, s2, type="l", col="red")
points(data$CombDate, s3, type="l", col="blue")
#add the legend
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c( "Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#close device to free resources
dev.off()

#DONE