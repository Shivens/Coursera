
# To execute just copy the relevant sections and exceute (Ctrl+R)

############ DATA INPUT - Reading file ######################

rm(list = ls())
#0) Ensure file "household_power_consumption.txt" is in source directory
#1) Reading the .TXT file correctly, by skipping initial rows
mydata<-read.csv("household_power_consumption.txt", sep = ";",header=TRUE,nrows=2880, skip=66636)
#2) Headers are lost by skipping so re-assigning column names
colnames(mydata)<-c( "Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#3) Check the read data
ls()
names(mydata)
mydata

############     Plot 2    ##################################

#1) Attach date and time as one string, ex:"2/2/2007 23:59:00"
timestr<-paste(mydata$Date,mydata$Time)
#2) Convert it to a time strip using 'Strptime()'
timestr<-strptime(timestr, "%d/%m/%Y %H:%M:%S")
#3) Plot Global active power against Time strip.
#plot(timestr,mydata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#Create PNG file
#dev.copy(png,file="Plot2.png")
#dev.off()
############     Plot 4    ##################################

#1) Creating the grid for the multiple plots
par(mfrow=c(2,2),mar=c(4,4,2,2),oma=c(1,1,1,1))
#2) Creating the individual plots in sequence
plot(timestr,mydata$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(timestr,mydata$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(timestr,mydata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(timestr,mydata$Sub_metering_2,col="red",type="l")
lines(timestr,mydata$Sub_metering_3,col="blue",type="l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("Black","Red","Blue"), lty=c(1,1,1))
plot(timestr,mydata$Global_reactive_power,type="l",xlab="datetime",ylab="Global reactive Power")

#Create PNG file
dev.copy(png,file="Plot4.png")
dev.off()

############     END    ##################################


