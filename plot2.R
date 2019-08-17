power_all <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
power_all$Date <- as.Date(power_all$Date, format = "%d/%m/%Y")
power <- power_all[which(power_all$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02"))), ]

power$DateTime <- paste(as.character(power$Date), power$Time, sep = " ")

power$Global_active_power <- as.numeric(as.character(power$Global_active_power))

png(file = "plot2.png")

plot(strptime(power$DateTime, format = "%Y-%m-%d %H:%M:%S"),
     power$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()