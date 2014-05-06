## Read Data and review
household_power_consumption <- read.csv("G:/R/Coursera Explora/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")
View(household_power_consumption)
str(household_power_consumption)
##Transform Data into adequate classes
household_power_consumption$Global_active_power<-as.numeric(as.character(household_power_consumption$Global_active_power))
household_power_consumption$Date <- strptime(household_power_consumption$Date, "%d/%m/%Y")
## Subset required data
sub.hpcs = subset(household_power_consumption, as.Date(Date) >= '2007-02-01'& as.Date(Date)< '2007-02-03')
## Create labels for X axis
rot<-c("Thu", "Fri","Sat")
## Create axis
plot(sub.hpcs$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="", main="Global Active Power (kilowatts)", xaxt = 'n')
axis(1, at=c(1,1440,2880), labels=rot[1:3])

## Create file PNG
png('plot2.png',width = 480, height = 480)
plot(sub.hpcs$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="",main="Global Active Power (kilowatts)", xaxt = 'n')
axis(1, at=c(1,1440,2880), labels=rot[1:3])
dev.off()
