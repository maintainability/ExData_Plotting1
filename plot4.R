connection <- file("household_power_consumption.txt")
open(connection)
header <- read.table(connection, nrow=1, sep=";", header=TRUE)
power <- read.table(connection, skip=66635, nrow=2880, sep=";")
close(connection)
names(power) <- names(header)
dataLength <- length(power$Global_active_power)

png("plot4.png")
par(mfrow=c(2,2))

plot(power$Global_active_power, type="l", xlab="", ylab="Global Active Power", xaxt="n")
axis(side=1, at=c(0, dataLength/2, dataLength), labels=c("Thu", "Fri", "Sat"))

plot(power$Voltage, type="l", xlab="datetime", ylab="Voltage", xaxt="n")
axis(side=1, at=c(0, dataLength/2, dataLength), labels=c("Thu", "Fri", "Sat"))

plot(power$Sub_metering_1, type="l", xaxt="n", xlab="", ylab="Energy sub metering")
points(power$Sub_metering_2, type="l", col="red")
points(power$Sub_metering_3, type="l", col="blue")
axis(side=1, at=c(0, dataLength/2, dataLength), labels=c("Thu", "Fri", "Sat"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1), bty="n")

plot(power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_rective_power", xaxt="n")
axis(side=1, at=c(0, dataLength/2, dataLength), labels=c("Thu", "Fri", "Sat"))

par(mfrow=c(1,1))
dev.off()
