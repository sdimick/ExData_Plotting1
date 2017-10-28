#Run sub_set_data on full data set to get csv to read in this script

#read and tansform data
data_classes <- c(rep("character", 2), rep("numeric", 7))
df <- read.csv("data/household_power_consumption.csv",
                 colClasses = data_classes)

breaks <- 0:15/2
png("plot1.png")
hist(df$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     breaks = breaks)
dev.off()
