## Read Data and review
## The script assumes G:/R/Coursera Explora/ as path. Change and adapt to your needs
household_power_consumption <- read.csv("G:/R/Coursera Explora/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")
View(household_power_consumption)
str(household_power_consumption)
##Transform Data into adequate classespng('plot4.png',width = 480, height = 480)


par(mfrow=c(2,2))
plot(sub.hpcs$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="", xaxt = 'n')
axis(1, at=c(1,1440,2880), labels=rot[1:3])
plot(sub.hpcs$Voltage, type="l",ylab="Voltage",xlab="datetime", xaxt = 'n')
axis(1, at=c(1,1440,2880), labels=rot[1:3])
plot(sub.hpcs$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="", xaxt = 'n')
axis(1, at=c(1,1440,2880), labels=rot[1:3])
lines(sub.hpcs$Sub_metering_2, col=2)
lines(sub.hpcs$Sub_metering_3, col=3)
legend(x="topright",  rot2, lwd=1, col=c(1,2,3), bty="n",xjust=1)
plot(sub.hpcs$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime", xaxt = 'n')
axis(1, at=c(1,1440,2880), labels=rot[1:3])
par(mfrow=c(1,1))
dev.off()
