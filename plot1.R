# Get portion of data
fname <- "household_power_consumption.txt"
headers <- read.table(fname, header=F, sep=";", nrows=1, as.is=T)
pc <- read.table(fname, header=F, sep=";", col.names=headers, na.strings="?", skip=45*24*60, nrows=5*24*60, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
# Get data for the two days
pcs <- pc[pc$Date=="1/2/2007" | pc$Date=="2/2/2007",]
# Generate a datetime column
pcs$datetime <- strptime(paste(pcs$Date, pcs$Time), format="%d/%m/%Y %H:%M:%S")

# Generate plot to file
png(file="plot1.png")
with(pcs, {
  hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
})
dev.off()
