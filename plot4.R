

# Plot 4

setwd("D:/Schulungen/coursera/DataScience-Specialization/R-Developing/4_ExploratoryDataAnalysis/Data")

# Read the File
FineInput <- read.csv("household_power_consumption.txt", sep=";", 
                      colClasses=c(rep("character",2),rep("numeric",7)), na.strings="?")

# Create Timestamp data + time columns
FineInput$Timestamp <- strptime(paste(FineInput$Date,FineInput$Time), format="%d/%m/%Y %H:%M:%S")


# Reduce Data to the timeframe that is requested (2007-02-01 to 2007-02-02)
ExploreDF = subset(FineInput,as.Date(FineInput$Timestamp) >= "2007-02-01" 
                   & as.Date(FineInput$Timestamp) < "2007-02-03")

# png
png(filename="plot4.png", height=480, width=480)

par(mfrow=c(2,2))

# 1st sub = Plot2

plot(ExploreDF$Timestamp,
     ExploreDF$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# 2nd sub 

plot(ExploreDF$Timestamp,
     ExploreDF$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

# 3rd sub = Plot3

# histogram plotting Part1
plot(ExploreDF$Timestamp,
     ExploreDF$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

# histogram plotting Part2
lines(ExploreDF$Timestamp,
      ExploreDF$Sub_metering_2,
      type="l",
      col="red")

# histogram plotting Part3
lines(ExploreDF$Timestamp,
      ExploreDF$Sub_metering_3,
      type="l",
      col="blue")

# 4th sub 

plot(ExploreDF$Timestamp,
     ExploreDF$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")


dev.off()