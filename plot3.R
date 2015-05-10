# Plot 3
##

household_power_consumption <- read.table("~/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";", quote="\"", na.strings="?")

hpc<-tbl_df(household_power_consumption)

hpcf<-filter(hpc,V1=="1/2/2007" | V1=="2/2/2007", !is.na(V3))

# frees memory
rm(hpc) 
rm(household_power_consumption)

# add a datetime column
hpcf<-mutate(hpcf,datetime=as.POSIXct(paste(V1,V2),format="%d/%m/%Y %H:%M:%S")) 

# convert V3, V7, V8, V9 column to numeric data type
#hpcf$V3=as.numeric(as.character(hpcf$V3)) 
#hpcf$V7=as.numeric(as.character(hpcf$V7)) 
#hpcf$V8=as.numeric(as.character(hpcf$V8)) 
#hpcf$V9=as.numeric(as.character(hpcf$V9)) 
hpcf[c(3,7:9)]<- sapply(hpcf[c(3,7:9)],function(l) {as.numeric(as.character(l))})

# draws the graphic with title and axis labels and color
plot(hpcf$datetime,hpcf$V7, type="l", main="", xlab="", ylab="Energy sub metering", col="black")
#adds lines for second and third series
lines(hpcf$datetime,hpcf$V8, type="l",col="red")
lines(hpcf$datetime,hpcf$V9, type="l",col="blue", sub="Sub_metering_3")
#adds legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), fill=c("black","red","blue"),lty=1,lwd=1)

# save plot to file
dev.copy(png, file = "plot3.png")
dev.off()