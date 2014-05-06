## Read and review the data.
## The script assumes G:/R/Coursera Explora/ as path. Change and adapt to your needs
household_power_consumption <- read.csv("G:/R/Coursera Explora/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")
View(household_power_consumption)
str(household_power_consumption)
## Transform Data into Active power into numeric
household_power_consumption$Global_active_power<-as.numeric(as.character(household_power_consumption$Global_active_power))
## Transform Date into Date class variable 
household_power_consumption$Date <- strptime(household_power_consumption$Date, "%d/%m/%Y")
## Subset Variables 
sub.hpcs = subset(household_power_consumption, as.Date(Date) >= '2007-02-01'& as.Date(Date)< '2007-02-03')

## Check histogram
hist(sub.hpcs$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
## Save final png

png('plot1.png',width = 480, height = 480)
hist(sub.hpcs$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
