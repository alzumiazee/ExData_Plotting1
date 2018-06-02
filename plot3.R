#reading data

powerdata1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")

#separating required data

powerdata2 <- powerdata1[powerdata1$Date %in% c("1/2/2007","2/2/2007") ,]
datedata <- strptime(paste(powerdata2$Date, powerdata2$Time,sep = ""),"%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(powerdata2$Sub_metering_1)
subMetering2 <- as.numeric(powerdata2$Sub_metering_2)
subMetering3 <- as.numeric(powerdata2$Sub_metering_3)

#set PNG parameters

png(filename = "plot3.png", width = 480, height = 480, units = "px")

#plot data
plot(datedata, subMetering1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(datedata, subMetering2, type="l", col="red")
lines(datedata, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()