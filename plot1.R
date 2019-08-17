power_all <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
power_all$Date <- as.Date(power_all$Date, format = "%d/%m/%Y")
power <- power_all[which(power_all$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02"))), ]
power$Global_active_power <- as.numeric(as.character(power$Global_active_power))
png(file = "plot1.png")
hist(power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
