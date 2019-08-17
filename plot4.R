power_all <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
power_all$Date <- as.Date(power_all$Date, format = "%d/%m/%Y")
power <- power_all[which(power_all$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02"))), ]

power$DateTime <- paste(as.character(power$Date), power$Time, sep = " ")

power$Global_active_power <- as.numeric(as.character(power$Global_active_power))

power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))

png(file = "plot4.png")
par(mfrow = c(2,2))
plot(strptime(power$DateTime, format = "%Y-%m-%d %H:%M:%S"), power$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power")

plot(strptime(power$DateTime, format = "%Y-%m-%d %H:%M:%S"), as.numeric(power$Voltage),
     type = "l", xlab = "datetime", ylab = "Voltage")

plot(strptime(power$DateTime, format = "%Y-%m-%d %H:%M:%S"), power$Sub_metering_1,
     xlab = "", ylab = "Energy sub metering", type = "n")
points(strptime(power$DateTime, format = "%Y-%m-%d %H:%M:%S"),
       power$Sub_metering_1, type = "l")
points(strptime(power$DateTime, format = "%Y-%m-%d %H:%M:%S"),
       power$Sub_metering_2, type = "l", col = "red")
points(strptime(power$DateTime, format = "%Y-%m-%d %H:%M:%S"),
       power$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1))

plot(strptime(power$DateTime, format = "%Y-%m-%d %H:%M:%S"),
       as.numeric(power$Global_reactive_power), type = "l", xlab = "datetime",
       ylab = "Global_reactive_power")

dev.off()