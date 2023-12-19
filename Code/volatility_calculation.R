rm(list = setdiff(ls(),lsf.str()))
library(data.table)
#library(flipTime)
library(dplyr)
library(stringr)
library(car)
library(lubridate)

dat <- fread("/Users/luzhang/Desktop/minutes_data_used_in_paper/SPY.csv")
dat <- data.frame(dat)

dat$date <- as.Date(dat$time)
dat$Time <- format(dat$time, format = "%H:%M:%S")


head(dat)

# focus on 9:31:00 to 15:30:00
keepsdat <- dat[dat$Time>="09:31:00" & dat$Time <="15:30:00",]

# count total time points per day
daypoints <- keepsdat %>% 
  group_by(date) %>%
  summarise(Freq = n())

daypoints <- data.frame(daypoints)
dim(daypoints)

# exclude the day which time points less then 360
dropdays <- daypoints[daypoints$Freq<360,]$date
data <- keepsdat[!keepsdat$date %in% dropdays,]
dim(data)

rs <- data$close/lag(data$close)-1
returns <- data.frame(data$date,data$Time,rs)
names(returns) <- c("date","Time","rs")
head(returns) 

returns <- returns[!returns$Time=="09:31:00",]

# calculate volatility per day
volatilities <- returns %>% 
   group_by(date) %>%
   summarise(volatility= sd(rs))

volatilities <- data.frame(volatilities)
head(volatilities)

fwrite(volatilities,"./Data/volatility_spy.csv")
