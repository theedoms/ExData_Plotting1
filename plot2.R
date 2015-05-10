# Plot 2
##

household_power_consumption <- read.table("~/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";", quote="\"", na.strings="?")

hpc<-tbl_df(household_power_consumption)

hpcf<-filter(hpc,V1=="1/2/2007" | V1=="2/2/2007", !is.na(V3))

# frees memory
rm(hpc) 
rm(household_power_consumption)

# add a datetime column
hpcf<-mutate(hpcf,datetime=as.POSIXct(paste(V1,V2),format="%d/%m/%Y %H:%M:%S")) 

# convert V3 column to numeric data type
hpcf$V3=as.numeric(as.character(hpcf$V3)) 

# draws the graphic with title and axis labels and color
plot(hpcf$datetime,hpcf$V3, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")

# save plot to file
dev.copy(png, file = "plot2.png")
dev.off()