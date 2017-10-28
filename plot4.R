#Run sub_set_data on full data set to get csv to read in this script

#read and tansform data
data_classes <- c(rep("character", 2), rep("numeric", 7))
df <- read.csv("data/household_power_consumption.csv",
               colClasses = data_classes)
dtstring <- paste(df$Date, df$Time, sep = " ")
df$datetime <- as.POSIXlt(dtstring, format="%m/%d/%Y %H:%M:%S")

png("plot4.png")

#set up full plot
par(mfrow = c(2,2))

#top left plot
plot(df$datetime, df$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

#top right plot
plot(df$datetime, df$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

#bottom left plot
plot(df$datetime, df$Sub_metering_3 * 1.2,
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")
lines(df$datetime, df$Sub_metering_1)
lines(df$datetime,df$Sub_metering_2, col = "red")
lines(df$datetime,df$Sub_metering_3, col = "blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black","red","blue"))

#bottom right plot
plot(df$datetime, df$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
