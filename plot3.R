require(dplyr)
require(lubridate)

png(filename = "plot3.png",width = 480,height = 480)
datos<- read.csv("data/household_power_consumption.txt",sep=";",na.strings = "?") %>%
  tbl_df() %>%
  filter(Date=="1/2/2007" | Date=="2/2/2007") %>%
  mutate(DateTime=dmy_hms(paste(Date,Time)))

with(datos,plot(Sub_metering_1 ~ DateTime,type="l",col="black",
            ylab="Energy sub metering",xlab=""))
with(datos,lines(Sub_metering_2 ~ DateTime,type="l", col="red"))
with(datos,lines(Sub_metering_3 ~ DateTime,type="l", col="blue"))
legend("topright",col=c("black","red","blue"),lwd=2,lty=c(1,1,1),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()  

