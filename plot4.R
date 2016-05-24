# load the saved dataset from plot1, plot2 and plot3 into R
library(datasets)
load("powerdata.Rda"); load("date_time.Rda"); load("Global_active_power.Rda")
load("subm1.Rda"); load("subm2.Rda"); load("subm3.Rda")

names(power)

# create a subset for Global reactive power and voltage. Make them numeric since
# their class is factor. 
grp <- as.numeric(power$Global_reactive_power)
vol <- as.numeric(power$Voltage)

# plot to a PNG file device using the required dimensions
# plotting row-wise
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 1, 1))
with(power, {
  plot(newset, gap, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
  plot(newset, vol, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(newset, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
  lines(newset, subMetering2, type = "l", col = "red")
  lines(newset, subMetering3, type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2.5, col = c("black", "red", "blue"), bty = "o")
  plot(newset, grp, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

# close the file device
dev.off()