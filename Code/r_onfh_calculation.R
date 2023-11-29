rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(flipTime)
library(dplyr)
library(stringr)
library(car)
library(lubridate)

dat <- fread("/Users/luzhang/Desktop/minutes_data_used_in_paper/SPY.csv")
dat <- data.frame(dat)

dat$date <- as.Date(dat$time)
dat$Time <- format(dat$time, format = "%H:%M:%S")


head(dat)
str(dat)

keeps <- c("10:00:00","16:00:00")
keepsdat <- dat[dat$Time %in% keeps,]
head(keepsdat)
dim(keepsdat)
tail(keepsdat)

# count total time points per day
daypoints <- keepsdat %>% 
  group_by(date) %>%
  summarise(Freq = n())

daypoints <- data.frame(daypoints)
dim(daypoints)

# exclude the day which time points less then 2
dropdays <- daypoints[daypoints$Freq<2,]$date
data <- keepsdat[!keepsdat$date %in% dropdays,]
dim(data)

rs <- data$close/lag(data$close)-1
returns <- data.frame(data$date,data$Time,rs)
names(returns) <- c("date","Time","rs")
head(returns) 

#write.csv(returns,"./Data/returns_test.csv",row.names = FALSE)

r_onfh <- returns[returns$Time == "10:00:00",]$rs
date <- returns[returns$Time == "10:00:00",]["date"]

rs <- cbind(date,r_onfh)
rs <- data.frame(rs)

head(rs)
tail(rs)
dim(rs)

write.csv(rs,"./Data/r_onfh_SPY.csv",row.names = FALSE)
