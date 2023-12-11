rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(tidyr)
library(car)
library(Rcpp)
library(moments)
library(tidyverse)

dat <- fread("./Data/returns_Gao_SPY.csv")
dat <- data.frame(dat)
dat <- dat %>% drop_na()
head(dat)
dim(dat)

r_buyandhold <- fread("./Data/r_buy_and_hold_SPY.csv")
r_buyandhold <- data.frame(r_buyandhold)
dim(r_buyandhold)

dat <- merge(dat, r_buyandhold, by = "date")
dim(dat)
head(dat)

#fwrite(dat,"./Data/market_timing_data.csv")
dat$etaonfh <- ifelse(dat$r_onfh>0, dat$r13, -dat$r13)
dat$etaonfh12 <- ifelse(dat$r_onfh>0 & dat$r12>0, dat$r13, 
                     ifelse(dat$r_onfh<0 & dat$r12<0, -dat$r13, 0))


dat$etaon <- ifelse(dat$r_on>0, dat$r13, -dat$r13)
dat$eta12 <- ifelse(dat$r12>0, dat$r13, -dat$r13)

dat$etaon12 <- ifelse(dat$r_on>0 & dat$r12>0, dat$r13, 
                     ifelse(dat$r_on<0 & dat$r12<0, -dat$r13, 0))


dat$etalag <- ifelse(dat$r13_lag<0, dat$r13, -dat$r13)
dat$etalagon <- ifelse(dat$r_on>0 & dat$r13_lag<0, dat$r13, 
                     ifelse(dat$r_on<0 & dat$r13_lag>0, -dat$r13, 0))


dat$etalag12 <- ifelse(dat$r12>0 & dat$r13_lag<0, dat$r13, 
                       ifelse(dat$r12<0 & dat$r13_lag>0, -dat$r13, 0))


dat$alwayslong <- dat$r13
dat$buyandhold <- dat$r_daily

dat$etalagon12 <- ifelse(dat$r13_lag<0 & dat$r_on>0 & dat$r12 >0, dat$r13, 
                         ifelse(dat$r13_lag>0 & dat$r_on<0 & dat$r12 <0,-dat$r13, 0))

dat$eta1011 <- ifelse(dat$r10>0 & dat$r11 >0, dat$r13, 
                      ifelse(dat$r10<0 & dat$r11 < 0, -dat$r13,0))

dat$eta10 <- ifelse(dat$r10>0 , dat$r13, -dat$r13)
dat$eta11 <- ifelse(dat$r11>0, dat$r13,-dat$r13 )

date_ <- dat$date
dat$date <- NULL

sapply(dat, function(x) c("avg ret" = round(mean(x)*100,4),
                          "stand dev" = round(sd(x)*100,4),
                          "skewness" = round(skewness(x),4),
                          "kurtosis" = round(kurtosis(x),4),
                          "success" = round(length(x[x>=0])/dim(dat)[1]*100,2)
                          
))

# count the number of long-short-N position
dat$d_onfh <- ifelse(dat$r_onfh>0, 1, -1)
dat$d_onfh12 <- ifelse(dat$r_onfh>0 & dat$r12>0, 1, 
                       ifelse(dat$r_onfh<0 & dat$r12<0, -1, 0))
dat$d_on <- ifelse(dat$r_on>0,1,-1)
dat$d_12 <- ifelse(dat$r12>0, 1, -1)
dat$d_on12 <- ifelse(dat$r_on>0 & dat$r12>0, 1, 
                     ifelse(dat$r_on<0 & dat$r12<0, -1, 0))
dat$d_lag <- ifelse(dat$r13_lag<0, 1, -1)
dat$d_lagon <- ifelse(dat$r_on>0 & dat$r13_lag<0, 1, 
                      ifelse(dat$r_on<0 & dat$r13_lag>0, -1, 0))
dat$d_lag12 <- dat$etalag12 <- ifelse(dat$r12>0 & dat$r13_lag<0, 1, 
                                      ifelse(dat$r12<0 & dat$r13_lag>0, -1, 0))
dat$d_lagon12 <- ifelse(dat$r13_lag<0 & dat$r_on>0 & dat$r12 >0, 1, 
                        ifelse(dat$r13_lag>0 & dat$r_on<0 & dat$r12 <0,-1, 0))
dat$d_10 <- ifelse(dat$r10>0 , 1, -1)
dat$d_11 <- ifelse(dat$r11>0, 1,-1)
dat$d_1011 <- ifelse(dat$r10>0 & dat$r11 >0, 1, 
                     ifelse(dat$r10<0 & dat$r11 < 0, -1,0))

dat$date <- date_
fwrite(dat, "./Data/market_timing_vis_data.csv")
# newey west t test
library(sandwich)
library(lmtest)
fit <- lm(dat$etalagon12~1)
NeweyWest(fit)
coeftest(fit, vcov = NeweyWest(fit))


