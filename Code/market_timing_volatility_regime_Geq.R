rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(tidyr)
library(car)
library(Rcpp)
library(moments)
library(tidyverse)

dat <- fread("./Data/returns_Gao_SPY_with_volatility.csv")
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

strategyReturnsGeq <- function(data, thres){
  dat <- data[data$volatility>=thres,]
  etaonfh <- ifelse(dat$r_onfh>0, dat$r13, -dat$r13)
  etaonfh12 <- ifelse(dat$r_onfh>0 & dat$r12>0, dat$r13, 
                          ifelse(dat$r_onfh<0 & dat$r12<0, -dat$r13, 0))
  etaon <- ifelse(dat$r_on>0, dat$r13, -dat$r13)
  eta12 <- ifelse(dat$r12>0, dat$r13, -dat$r13)
  etaon12 <- ifelse(dat$r_on>0 & dat$r12>0, dat$r13, 
                        ifelse(dat$r_on<0 & dat$r12<0, -dat$r13, 0))
  etalag <- ifelse(dat$r13_lag<0, dat$r13, -dat$r13)
  etalagon <- ifelse(dat$r_on>0 & dat$r13_lag<0, dat$r13, 
                         ifelse(dat$r_on<0 & dat$r13_lag>0, -dat$r13, 0))
  etalag12 <- ifelse(dat$r12>0 & dat$r13_lag<0, dat$r13, 
                         ifelse(dat$r12<0 & dat$r13_lag>0, -dat$r13, 0))
  alwayslong <- dat$r13
  buyandhold <- dat$r_daily
  etalagon12 <- ifelse(dat$r13_lag<0 & dat$r_on>0 & dat$r12 >0, dat$r13, 
                           ifelse(dat$r13_lag>0 & dat$r_on<0 & dat$r12 <0,-dat$r13, 0))
  eta1011 <- ifelse(dat$r10>0 & dat$r11 >0, dat$r13, 
                        ifelse(dat$r10<0 & dat$r11 < 0, -dat$r13,0))
  eta10 <- ifelse(dat$r10>0 , dat$r13, -dat$r13)
  eta11 <- ifelse(dat$r11>0, dat$r13,-dat$r13 )
  
  returns <- data.frame(etaonfh, etaonfh12,etaon,eta12,etaon12,etalag,
                        etalagon,etalag12, alwayslong, buyandhold, etalagon12,
                        eta1011, eta10, eta11)
  StrategyRts <- sapply(returns, function(x) c("avg ret" = round(mean(x)*100,4),
                            "stand dev" = round(sd(x)*100,4),
                            "skewness" = round(skewness(x),4),
                            "kurtosis" = round(kurtosis(x),4),
                            "success" = round(length(x[x>=0])/dim(dat)[1]*100,2)
                            
  ))
  return(StrategyRts)
}

NShortOrLong <- function(data, thres){
  # count the number of long-short-N position
  dat <- data[data$volatility>=thres,]
  d_onfh <- ifelse(dat$r_onfh>0, 1, -1)
  d_onfh12 <- ifelse(dat$r_onfh>0 & dat$r12>0, 1, 
                         ifelse(dat$r_onfh<0 & dat$r12<0, -1, 0))
  d_on <- ifelse(dat$r_on>0,1,-1)
  d_12 <- ifelse(dat$r12>0, 1, -1)
  d_on12 <- ifelse(dat$r_on>0 & dat$r12>0, 1, 
                       ifelse(dat$r_on<0 & dat$r12<0, -1, 0))
  d_lag <- ifelse(dat$r13_lag<0, 1, -1)
  d_lagon <- ifelse(dat$r_on>0 & dat$r13_lag<0, 1, 
                        ifelse(dat$r_on<0 & dat$r13_lag>0, -1, 0))
  d_lag12 <- dat$etalag12 <- ifelse(dat$r12>0 & dat$r13_lag<0, 1, 
                                        ifelse(dat$r12<0 & dat$r13_lag>0, -1, 0))
  d_lagon12 <- ifelse(dat$r13_lag<0 & dat$r_on>0 & dat$r12 >0, 1, 
                          ifelse(dat$r13_lag>0 & dat$r_on<0 & dat$r12 <0,-1, 0))
  d_10 <- ifelse(dat$r10>0 , 1, -1)
  d_11 <- ifelse(dat$r11>0, 1,-1)
  d_1011 <- ifelse(dat$r10>0 & dat$r11 >0, 1, 
                       ifelse(dat$r10<0 & dat$r11 < 0, -1,0))
  nSL <- data.frame(d_onfh, d_onfh12,d_on,d_12,d_on12,d_lag,
                    d_lagon,d_lag12,d_lagon12,d_1011,d_10,d_11)
  StrategynSL <- sapply(nSL, function(x) c("neural" = length(x[x==0]),
                                           "long" = length(x[x==1]),
                                           "short" = length(x[x==-1])
                                            ))
  return(StrategynSL)
}


thres <- 1.00E-04

ReturnsGeq <- strategyReturnsGeq(dat, thres)
ReturnsGeq <- data.frame(ReturnsGeq)
ReturnsGeq$rowname <- rownames(ReturnsGeq)

nSLGeq <- NShortOrLong(dat,thres)
nSLGeq <- data.frame(nSLGeq)
nSLGeq$rowname <- rownames(nSLGeq)


fwrite(ReturnsGeq,"./Data/AReturnsVolatilityGeq.csv")
fwrite(nSLGeq,"./Data/AnSLGeqVolatility.csv")



#fwrite(dat01, "./dat01a/market_timing_vis_dat01a.csv")
# newey west t test
#library(sandwich)
#library(lmtest)
#fit <- lm(dat01$etalagon12~1)
#NeweyWest(fit)
#coeftest(fit, vcov = NeweyWest(fit))


