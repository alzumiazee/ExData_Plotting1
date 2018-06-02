#reading data

powerdata1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")

#separating required data

powerdata2 <- powerdata1[powerdata1$Date %in% c("1/2/2007","2/2/2007") ,]
datedata <- strptime(paste(powerdata2$Date, powerdata2$Time,sep = ""),"%d/%m/%Y %H:%M:%S")
powerdata3 <- as.numeric(powerdata2$Global_active_power)

#set PNG parameters

png(filename = "plot2.png", width = 480, height = 480, units = "px")

#plot data
plot(datedata, powerdata3, type="l", xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()