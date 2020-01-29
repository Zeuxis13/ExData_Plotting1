library(dplyr)

# Reading data
data <- read.csv(file = '~/household_power_consumption.txt', header = TRUE, sep = ';', dec = '.',
                 colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),
                 na.strings = '?')

# Filter only on 2007-02-01 and 2007-02-02
data_filtered <- data %>%
  mutate(date = as.Date(Date, format = "%d/%m/%Y")) %>%
  filter(date == '2007-02-01' | date == '2007-02-02') %>%
  mutate(date_time = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# Plot 3: Plot line of Global Active Power on the two days 2007-02-01 and 2007-02-02
png(file = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

plot(data_filtered$date_time, data_filtered$Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub-metering")
lines(data_filtered$date_time, data_filtered$Sub_metering_2, type = 'l', col = "red")
lines(data_filtered$date_time, data_filtered$Sub_metering_3, type = 'l', col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()

# Note: he x-axis corresponds to the days in French: jeudi = Thursday, vendredi = Friday, samedi = Saturday