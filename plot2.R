require(dplyr)
require(lubridate)

png(filename = "plot2.png",width = 480,height = 480)
datos<- read.csv("data/household_power_consumption.txt",sep=";",na.strings = "?") %>%
  tbl_df() %>%
  filter(Date=="1/2/2007" | Date=="2/2/2007") %>%
  mutate(DateTime=dmy_hms(paste(Date,Time))) %>%
  with(plot(Global_active_power ~ DateTime,type="l",
            ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()  

