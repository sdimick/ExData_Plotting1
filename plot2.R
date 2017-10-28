#Run sub_set_data on full data set to get csv to read in this script

#read and tansform data
data_classes <- c(rep("character", 2), rep("numeric", 7))
df <- read.csv("data/household_power_consumption.csv",
               colClasses = data_classes)
dtstring <- paste(df$Date, df$Time, sep = " ")
df$datetime <- as.POSIXlt(dtstring, format="%m/%d/%Y %H:%M:%S")

png("plot2.png")
plot(df$datetime, df$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
