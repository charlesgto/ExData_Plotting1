setwd("~/R_PROGRAME/exdata_data_household_power_consumption")
DataHPC <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(DataHPC, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
Datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(Datetime)
with(data1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
})
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
