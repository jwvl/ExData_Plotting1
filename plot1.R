# Plotting script for first figure
# jwvl, 10 May 2014

# Read data file
data <- read.csv("household_power_consumption-Subset.csv")
# Set title and x-axis label to string
mainTitle <- "Global Active Power"
xLabel = "Global Active Power (kilowatts)"

#Make histogram
png(file="plot1.png")
hist(data$Global_active_power,col="red",main=mainTitle,xlab=xLabel)
dev.off()