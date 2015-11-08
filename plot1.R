require(dplyr)
#require(lubridate)

png(filename = "plot1.png",width = 480,height = 480)
datos<- read.csv("data/household_power_consumption.txt",sep=";",na.strings = "?") %>%
  tbl_df() %>%
  filter(Date=="1/2/2007" | Date=="2/2/2007") %>%
  mutate(Date=as.Date(strptime(Date,"%d/%m/%Y"))) %>%
  mutate(Time=as.Date(strptime(Time,"%H:%M:%S"))) %>%
  with(hist(Global_active_power,col="red",
     main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()  

