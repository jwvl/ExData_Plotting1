# Plotting script for fourth figure
# jwvl, 10 May 2014

# Read data file
data <- read.csv("household_power_consumption-Subset.csv")
# Append date and time cols

data<- within(data, DateAndTime <- paste(data$Date,data$Time,sep=' '))
data$DateAndTime <- strptime(data$DateAndTime, "%d/%m/%Y %H:%M:%S")

# Set graphics device to PNG

png(file="plot4.png")
# Set 2x2 plot
par(mfrow = c(2, 2))
title1 <- "Global Active Power"
yLab1 <- "Global Active Power"
yLab2 <- "Voltage"
yLab3<-"Energy sub metering"
yLab4 <- "Global_reactive_power"
#par(cex = 0.6)

## Plot the four figures
with(data, {
    # First plot is same as plot 2 from plot2.R
    plot(as.POSIXlt(data$DateAndTime),data$Global_active_power,ylab=yLab1,xlab="", type="l")
    
    plot(as.POSIXlt(data$DateAndTime),data$Voltage,ylab=yLab2,xlab="datetime", type="l")
    
    # Third plot is same as plot 3 from plot2.R
    plot(as.POSIXlt(data$DateAndTime),data$Sub_metering_1,ylab=yLab3,xlab=xLabel,type="n")
    lines(as.POSIXlt(data$DateAndTime),data$Sub_metering_1,col="black",type="l")
    lines(as.POSIXlt(data$DateAndTime),data$Sub_metering_2,col="red",type="l")
    lines(as.POSIXlt(data$DateAndTime),data$Sub_metering_3,col="blue",type="l")
    legend("topright", col = c("black", "red", "blue"), lty=c(1,1), bty="n", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
    
    plot(as.POSIXlt(data$DateAndTime),data$Global_reactive_power, xlab="datetime", ylab = yLab4, type="l")
})
# Close graphics device
dev.off()