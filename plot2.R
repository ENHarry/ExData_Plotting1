# load the saved dataset from plot1 into R
library(datasets)
load("powerdata.Rda")
load("Global_active_power.Rda")

# strip the date and time into "days, months, year" and "hours, mins, secs"
# save the subset
newset <- strptime(paste(power$Date, power$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
save(newset, file = "date_time.Rda")

# plot to a PNG file device using the required dimensions
png("plot2.png", width = 480, height = 480)
plot(newset, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# close the file device
dev.off()