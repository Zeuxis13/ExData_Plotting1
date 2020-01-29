library(dplyr)

# Reading data
data <- read.csv(file = '~/household_power_consumption.txt', header = TRUE, sep = ';', dec = '.',
                 colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),
                 na.strings = '?') %>%
  mutate(Date = as.Date(Date, format = "%d/%m/%Y"))

# Filter only on 2007-02-01 and 2007-02-02
data_filtered <- data %>% filter(Date == '2007/02/01' | Date == '2007/02/02')

# Plot 1: Histogram of Global Active Power 
png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

hist(data_filtered$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red",
     main = "Global Active Power")

dev.off()
