# load the saved dataset from plot1 and plot2 into R
library(datasets)
load("powerdata.Rda")
load("date_time.Rda")

names(power)

# create a subset for sub_metering 1 to 3 and make them numeric since
# their class is factor and save 
subMetering1 <- as.numeric(power$Sub_metering_1)
save(subMetering1, file = "subm1.Rda")

subMetering2 <- as.numeric(power$Sub_metering_2)
save(subMetering2, file = "subm2.Rda")

subMetering3 <- as.numeric(power$Sub_metering_3)
save(subMetering3, file = "subm3.Rda")

# plot to a PNG file device using the required dimensions
png("plot3.png", width = 480, height = 480)
plot(newset, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(newset, subMetering2, type = "l", col = "red")
lines(newset, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

# close the file device
dev.off()