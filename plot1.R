## download the file and storing it at specific location
# Specify URL where file is stored
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# Specify destination where file should be saved
wd<- getwd()
destfile<- paste(wd,"/Assignment01_module_04.zip", sep="")
# Apply download.file function in R
download.file(url, destfile)
#unzip the file
unzip(destfile, files = NULL, list = FALSE, overwrite = TRUE,junkpaths = FALSE, exdir = '.', unzip = "internal",setTimes = FALSE)

##reading data from txt file into R object
destfile_data_01<- paste(wd,"/household_power_consumption.txt", sep="")
features<- read.table(destfile_data_01, sep = ";", header = TRUE)

features$Date_Time<- as.POSIXct(paste(features$Date, features$Time, sep= " "), format="%d/%m/%Y %H:%M:%S",tz="GMT")
data_002 <- subset(features, features$Date == "2/2/2007", select = c("Date_Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data_001 <- subset(features, features$Date == "1/2/2007", select = c("Date_Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data_set_one<- rbind(data_001, data_002)
data_set_one$Global_active_power<- as.numeric(data_set_one$Global_active_power)
par(mfrow= c(1,1))
hist(data_set_one$Global_active_power, col="red", breaks = 12,xlab= "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

png(filename = "plot1.png", width = 480, height = 480, units = "px")
par(mfrow= c(1,1))
hist(data_set_one$Global_active_power, col="red", breaks = 12,xlab= "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()
