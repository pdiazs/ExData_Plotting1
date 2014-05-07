## Read Data and review
## The script assumes G:/R/Coursera Explora/ as path. Change and adapt to your needs
household_power_consumption <- read.csv("G:/R/Coursera Explora/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")
View(household_power_consumption)
str(household_power_consumption)
##Transform Data into adequate classes subset and define Var x
household_power_consumption$Date <- strptime(household_power_consumption$Date, "%d/%m/%Y")
sub.hpcs = subset(household_power_consumption, as.Date(Date) >= '2007-02-01'& as.Date(Date)< '2007-02-03')
sub.hpcs[ sub.hpcs == "?" ] = NA
sub.hpcs$Sub_metering_1<-as.numeric(as.character(sub.hpcs$Sub_metering_1))
sub.hpcs$Sub_metering_2<-as.numeric(as.character(sub.hpcs$Sub_metering_2))
sub.hpcs$Sub_metering_3<-as.numeric(as.character(sub.hpcs$Sub_metering_3))

## Auxiliary variables
rot<-c("Thu", "Fri","Sat")
rot2<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
## Graphic device
png('plot4.png',width = 480, height = 480)
plot(sub.hpcs$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="", xaxt = 'n')
axis(1, at=c(1,1440,2880), labels=rot[1:3])
lines(sub.hpcs$Sub_metering_2, col=2)
lines(sub.hpcs$Sub_metering_3, col=3)
legend(x="topright", rot2, lwd=1, col=c(1,2,3))
dev.off()
