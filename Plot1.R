filename <- "household_power_consumption.txt"

##read chunk of the file the includes the records we are interested in
data <- read.csv (filename, sep=";", nrows=69574)  

#convert the string the data and filter by the date -- fine grin filtering of on very specific dates
data$Date = as.Date(data$Date, "%d/%m/%Y")
d <- data[data$Date == "2007-02-02" | data$Date == "2007-02-01",]

#convert values from factors to numerics 
global<- as.numeric(as.character(d$Global_active_power))

#create a png device to create output file
png(filename="plot1.png",width = 480, height = 480)
#draw histogram of Active Power
hist(global, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#close device to free resources
dev.off()


#DONE