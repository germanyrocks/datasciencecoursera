temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
power <- read.table(unz(temp, 'household_power_consumption.txt'), sep = ';', header = TRUE)
unlink(temp)

library(lubridate)
power$Date <- dmy(power$Date)
power <- power[power$Date >= '2007-02-01' & power$Date <= '2007-02-02',]
sum(grepl('\\?', power)) ##check for null values

png(filename = "plot1.png",
    width = 480, height = 480)
hist(as.numeric(power$Global_active_power)/500, col ='red', xlab = 'Global Active Power (kilowatts)',main= 'Global Active Power') 
dev.off()
power$dtm <- ymd_hms(paste(power$Date,power$Time,sep=' '))


