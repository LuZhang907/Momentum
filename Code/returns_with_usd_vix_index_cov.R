rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(dplyr)
library(stringr)
library(car)
library(lubridate)

vix <- fread("/Users/luzhang/Desktop/minutes_data_used_in_paper/vix.csv")
usd <- fread("/Users/luzhang/Desktop/minutes_data_used_in_paper/usd.csv")
dat <- fread("./Data/returns_Gao_SPY_with_volatility.csv")

vix <- data.frame(vix)
usd <- data.frame(usd)
dat <- data.frame(dat)

# previous day close price
vix$vixlagclose <- lag(vix$Close)
usd$usdlagclose <- lag(usd$Close)

# day to day close price change
vix$vixpct <- (vix$Close-lag(vix$Close))/lag(vix$Close)
usd$usdpct <- (usd$Close-lag(usd$Close))/lag(usd$Close)

vix$date <- as.Date(vix$Date)
usd$date <- as.Date(usd$Date)

vix <- vix %>% select(date, vixlagclose, vixpct)
usd <- usd %>% select(date, usdlagclose, usdpct)

dim(dat)
dim(vix)
dim(usd)

vix_usd <- merge(vix, usd, by="date")
data <- merge(dat, vix_usd, by="date")

dim(data)
head(data)

#fwrite(data, "./Data/returns_vix_usd_spy.csv")
date_ <- data$date
data$date <- NULL
mylm <- lm(r13~.-r_onfh-volatility, data = data)
summary(mylm)
vif(mylm)
