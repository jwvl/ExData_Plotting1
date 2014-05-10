# Script for Course Project 1 in the
# Coursera "Exploratory Data Analysis" course

# Read in data
testData <- read.csv("household_power_consumption.txt",sep=";")

#Subset necessary dates
ss <- subset(testData, testData$Date == "01/02/2007" | testData$Date == "02/02/2007")

#Convert times to times and dates
ss$Date <- as.Date(ss$Date)
ss$Time <- strptime(ss$Time, "%H:%M:%S")
write.csv(ss, "household_power_consumption-Subset.csv")