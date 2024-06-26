rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(flipTime)
library(dplyr)
library(stringr)
library(car)
library(lubridate)
library(tidyverse)
library(naniar)

dat <- fread("/Users/luzhang/Desktop/data/SPY.csv")
dat <- data.frame(dat)

dat$open <- NULL
dat$high <- NULL
dat$low <- NULL
dat$volume <- NULL

options(digits.secs=3)
Sys.setenv(TZ='EST')

dat$Time<-as.POSIXct(dat$time,format="%H:%M:%OS", taz="EST")
dat$time <- NULL

dat$date <- as.Date(dat$Time)
# minutes since the midnight
dat$minutes <- lubridate::hour(dat$Time)*60+lubridate::minute(dat$Time) 

#head(dat)
#str(dat)

keeps <- seq(575,930,5)
keepsdat <- dat[dat$minutes %in% keeps,]
head(keepsdat)
tail(keepsdat)
dim(keepsdat)

# count total time points per day
daypoints <- keepsdat %>% 
  group_by(date) %>%
  summarise(Freq = n())

daypoints <- data.frame(daypoints)
dim(daypoints)

# exclude the day which time points less then 72
dropdays <- daypoints[daypoints$Freq<72,]$date
data <- keepsdat[!keepsdat$date %in% dropdays,]
dim(data)

# calculate returns per day
returns <- data %>% 
   group_by(date) %>%
   mutate(rs = close/lag(close,6)-1)

returns <- data.frame(returns)
head(returns,10)

n_row <- dim(daypoints)[1]-length(dropdays)
n_col <- 66
rst <- matrix(rep(0,n_row*n_col), nrow = n_row, ncol = n_col)

# rolling returns from 9:35-15:30, r1-r66
index <- seq(605,930,5)
for (i in 1:n_col){
  rst[,i] <- returns[returns$minutes==index[i],]$rs
}

rst <- data.frame(rst)
names(rst) <- paste0("r",seq(1,66))
head(rst) 

# add date
rst$date <- data[data$minutes == 605,]$date

# input r_LH_lag, r_on, r_FH(9:31-9:35),and R_LH
rs4 <- fread("./Data/returns_spy.csv")
rs4 <- data.frame(rs4)
head(rs4)

rs4 <- rs4 %>% select(date, r13_lag, r_on,r1, r13)
names(rs4) <- c("date","r_LH_lag","r_on","r_FH","r_LH")
head(rs4)

returns_all <- merge(rst, rs4, by = "date")
dim(returns_all)

write.csv(returns_all,"./Data/rolling_returns.csv",row.names = FALSE)

#days <- unique(dat$date)
#missing <- ifelse(days%in%dropdays,1,0)
#missing_days <- data.frame(days, missing)
#head(missing_days)

#write.csv(missing_days,"./Data/missing_day_record.csv",row.names = FALSE)
