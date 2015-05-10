

# Plot 1
# Frequency vs Global Active Power (kilowatts)

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
png(filename="plot1.png", height=480, width=480)

# histogram plotting
hist(ExploreDF$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

dev.off()