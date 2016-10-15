temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
power <- read.table(unz(temp, 'household_power_consumption.txt'), sep = ';', header = TRUE)
unlink(temp)

library(lubridate)
power$Date <- dmy(power$Date)
power <- power[power$Date >= '2007-02-01' & power$Date <= '2007-02-02',]
sum(grepl('\\?', power)) ##check for null values

png(filename = "plot3.png",
    width = 480, height = 480)
plot( power$dtm, y =power$Sub_metering_1, type ='l', col='black', ylab = 'Energy sub metering', xlab = '')
lines( power$dtm, y =power$Sub_metering_2, col='blue')
lines( power$dtm, y =power$Sub_metering_3, col='red' )
legend("topright",
       inset=.05,
       cex = 1,
       title="Legend",
       names(power)[7:9],
       horiz=FALSE,
       lty=c(1,1),
       lwd=c(2,2),
       col=c("black","red","blue")
       
       dev.off()
    