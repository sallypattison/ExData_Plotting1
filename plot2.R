power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power_sub <- subset(power, power$Date >= "2007-02-01" & power$Date <"2007-02-03") 
power_sub$Date <- as.character(power_sub$Date)
DateTime <- with(power_sub, paste(Date, Time))
DateTime2 <- as.POSIXct(DateTime, format = "%Y-%m-%d %H:%M:%S")
power_sub2 <- cbind(power_sub, DateTime2)
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(power_sub2, plot(DateTime2, Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l", xlab =""))
dev.off()
