# read dataset into R
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileurl, temp) 
unzip(temp, list = T)
dataset1 <- read.table(unzip(temp, "household_power_consumption.txt"), header = T, sep = ";", stringsAsFactors = F, dec = ".")
unlink(temp)

# create a subset for 2007-02-01 and 2007-02-02. Save the dataset
power <- dataset1[dataset1$Date %in% c("1/2/2007","2/2/2007") ,]
save(power, file = "powerdata.Rda")
names(power)

# create a subset for Global active power and make it numeric since
# its class is factor and save it
gap <- as.numeric(power$Global_active_power)
save(gap, file = "Global_active_power.Rda")

# plot the histogram to a PNG file device using the required dimensions
png("plot1.png", width = 480, height = 480)
hist(gap, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

# close the file device
dev.off()

