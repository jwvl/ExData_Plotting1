# Plotting script for third figure
# jwvl, 10 May 2014

# Read data file
data <- read.csv("household_power_consumption-Subset.csv")
# Append date and time cols

data<- within(data, DateAndTime <- paste(data$Date,data$Time,sep=' '))
print(head(data))
data$DateAndTime <- strptime(data$DateAndTime, "%d/%m/%Y %H:%M:%S")
print(head(data))
# Set x-axis and y-axis label to string
yLabel <- "Energy sub metering"
xLabel <- ""
#Make line graphs
png(file="plot3.png")
plot(as.POSIXlt(data$DateAndTime),data$Sub_metering_1,ylab=yLabel,xlab=xLabel,type="n")
lines(as.POSIXlt(data$DateAndTime),data$Sub_metering_1,col="black",type="l")
lines(as.POSIXlt(data$DateAndTime),data$Sub_metering_2,col="red",type="l")
lines(as.POSIXlt(data$DateAndTime),data$Sub_metering_3,col="blue",type="l")
legend("topright", col = c("black", "red", "blue"), lty=c(1,1), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
dev.off()