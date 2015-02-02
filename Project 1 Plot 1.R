
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

############     Plot 1    ##################################

# 1) Create the histagram for ( 'Global active power' subdata from master database 'Mydata')

hist(mydata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")

#Create PNG file

dev.copy(png,file="Plot1.png")
dev.off()
############     END    ##################################
