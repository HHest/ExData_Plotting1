# Get portion of data
fname <- "household_power_consumption.txt"
pc <- read.table(fname, header=F, sep=";", na.strings="?", skip=45*24*60, nrows=5*24*60, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
pch <- read.table(fname, header=F, sep=";", nrows=1, as.is=T)
names(pc) <- pch
# Get data for the two days
pcs <- pc[pc$Date=="1/2/2007" | pc$Date=="2/2/2007",]
# Generate a datetime column
pcs$datetime <- strptime(paste(pcs$Date, pcs$Time), format="%d/%m/%Y %H:%M:%S")

# Make sure to display dates in English format
Sys.setlocale("LC_TIME", "en_GB.UTF-8")

# Generate plot to file
png(file="plot2.png")
with (pcs, {
  plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()