#reading data

powerdata1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")

#separating required data

powerdata2 <- powerdata1[powerdata1$Date %in% c("1/2/2007","2/2/2007") ,]
powerdata3 <- as.numeric(powerdata2$Global_active_power)

#set PNG parameters

png(filename = "plot1.png", width = 480, height = 480, units = "px")

#plot data

hist(powerdata3,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab = "Frequency")
dev.off()