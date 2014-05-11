# Plotting script for second figure
# jwvl, 10 May 2014

# Read data file
data <- read.csv("household_power_consumption-Subset.csv")
# Append date and time cols

data<- within(data, DateAndTime <- paste(data$Date,data$Time,sep=' '))
print(head(data))
data$DateAndTime <- strptime(data$DateAndTime, "%d/%m/%Y %H:%M:%S")
print(head(data))
# Set x-axis and y-axis label to string
yLabel <- "Global Active Power (kilowatts)"
xLabel <- ""
#Make line graph
png(file="plot2.png")
plot(as.POSIXlt(data$DateAndTime),data$Global_active_power,ylab=yLabel,xlab=xLabel,type="l")
dev.off()