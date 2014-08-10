filename <- "household_power_consumption.txt"
#read chunk of the file the includes the records we are interested in
data <- read.csv (filename, sep=";", nrows=69574)

#filter by the date -- fine grin filtering of on very specific dates
data <- data[as.Date(data$Date, "%d/%m/%Y") == "2007-02-02" | as.Date(data$Date, "%d/%m/%Y") == "2007-02-01",]
#Combine the date and time to allow x-axis view
data$CombDate <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#Convert value to numeric
global<- as.numeric(as.character(data$Global_active_power))

#create a png device to create output file
png(filename="plot2.png",width = 480, height = 480)
#plot Global Active Power over time
plot(data$CombDate,global, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#close device to free resources
dev.off()

#DONE