# Plot 4
##

household_power_consumption <- read.table("~/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";", quote="\"", na.strings="?")

hpc<-tbl_df(household_power_consumption)

hpcf<-filter(hpc,V1=="1/2/2007" | V1=="2/2/2007", !is.na(V3), !is.na(V4), !is.na(V5))

# frees memory
rm(hpc) 
rm(household_power_consumption)

# add a datetime column
hpcf<-mutate(hpcf,datetime=as.POSIXct(paste(V1,V2),format="%d/%m/%Y %H:%M:%S")) 

# convert V3,V4,V5, V7, V8, V9 column to numeric data type
hpcf[c(3:5,7:9)]<- sapply(hpcf[c(3:5,7:9)],function(l) {as.numeric(as.character(l))})

# Prepares layout for 4 graphics
par(mfrow=c(2, 2))
# draws the graphics with title and axis labels and color
# Plot 1 - Global Active Power
plot(hpcf$datetime,hpcf$V3, type="l", main="", xlab="", ylab="Global Active Power")

# Plot 2 - Global voltage
plot(hpcf$datetime,hpcf$V5, type="l", main="", xlab="datetime", ylab="Voltage")

# Plot 3 - sub Metering
plot(hpcf$datetime,hpcf$V7, type="l", main="", xlab="", ylab="Energy sub metering", col="black")
#adds lines for second and third series
lines(hpcf$datetime,hpcf$V8, type="l",col="red")
lines(hpcf$datetime,hpcf$V9, type="l",col="blue", sub="Sub_metering_3")
#adds legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), fill=c("black","red","blue"),lty=1,lwd=1)

# Plot 4 - Global Reactive Power
plot(hpcf$datetime,hpcf$V4, type="l", main="", xlab="datetime", ylab="Global Reactive Power (kilowatts)")

# save plot to file
dev.copy(png, file = "plot4.png")
dev.off()