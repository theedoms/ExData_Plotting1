# Plot 1
##

household_power_consumption <- read.table("~/GitHub/ExData_Plotting1/household_power_consumption.txt", sep=";", quote="\"")

hpc=tbl_df(household_power_consumption)

hpcf=filter(hpc,V1=="1/2/2007" | V1=="2/2/2007")

rm(hpc) # free memory

# hpcf$datetime= as.POSIXct(coldate,format="%d/%m/%Y %H:%M:%S") # add a datetime column

globalActivePower<- filter(select(hpcf,V3), V3!= "?")  # selects the V3 column and filters "?"


globalActivePower<-as.numeric(as.character(globalActivePower$V3)) # makes it a numeric vector

# draws the histogram with title and axis labels and color
hist(globalActivePower,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# save plot to file
dev.copy(png, file = "plot1.png")
dev.off()