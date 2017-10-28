#Read in full txt file, subset to relevant timeperiod, write to csv
data_classes <- c(rep("character", 2), rep("numeric", 7))
full_data <- read.table("data/household_power_consumption.txt",
                        header=TRUE,
                        sep=";",
                        na.strings = "?",
                        colClasses = data_classes
                        )
keep_dates <- c("2/1/2007","2/2/2007")
keep_data <- full_data[full_data$Date %in% keep_dates,]
write.csv(keep_data,
          "data/household_power_consumption.csv",
          quote = FALSE,
          row.names = FALSE)
rm(list = ls())
