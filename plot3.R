# Get portion of data
fname <- "household_power_consumption.txt"
headers <- read.table(fname, header=F, sep=";", nrows=1, as.is=T)
pc <- read.table(fname, header=F, sep=";", col.names=headers, na.strings="?", skip=45*24*60, nrows=5*24*60, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
# Get data for the two days
pcs <- pc[pc$Date=="1/2/2007" | pc$Date=="2/2/2007",]
# Generate a datetime column
pcs$datetime <- strptime(paste(pcs$Date, pcs$Time), format="%d/%m/%Y %H:%M:%S")

# Make sure to display dates in English format
Sys.setlocale("LC_TIME", "en_GB.UTF-8")

# Generate plot to file
png(file="plot3.png")
with(pcs, {
  plot(datetime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", lty="solid", col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()