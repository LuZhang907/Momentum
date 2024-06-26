rm(list = setdiff(ls(),lsf.str()))
library(data.table)

dat <- fread("./Data/market_timing_data.csv")
dat$year <- format(dat$date, "%Y")

dat2018 <- dat[dat$year=="2018",]
dim(dat2018)

dat2018$eta7 <- ifelse(dat2018$r7>0, dat$r13, -dat$r13)
dat2018$eta10 <- ifelse(dat2018$r10>0, dat$r13, -dat$r13)
dat2018$eta11 <- ifelse(dat2018$r11>0, dat$r13, -dat$r13)

dat2018$eta710 <- ifelse(dat2018$r7>0 & dat2018$r10>0,dat$r13, 
                         ifelse(dat2018$r7< 0 & dat2018$r10<0, -dat$r13,0))
dat2018$eta1011 <- ifelse(dat2018$r10>0 & dat2018$r11>0,dat$r13, 
                          ifelse(dat2018$r10< 0 & dat2018$r11<0, -dat$r13,0))
dat2018$eta711 <- ifelse(dat2018$r7>0 & dat2018$r11>0,dat$r13, 
                         ifelse(dat2018$r7< 0 & dat2018$r11<0, -dat$r13,0))
dat2018$alwayslong <- dat2018$r13
dat2018$buyandhold <- dat2018$r_daily

dat2018$date <- NULL
dat2018$year <- NULL
sapply(dat2018, function(x) c("avg ret" = round(mean(x)*100,4),
                              "stand dev" = round(sd(x)*100,4),
                              "skewness" = round(skewness(x),4),
                              "kurtosis" = round(kurtosis(x),4),
                              "success" = round(length(x[x>=0])/dim(dat2018)[1]*100,2)
                              
))


dat2018$d_10 <- ifelse(dat2018$r10>0 , 1, -1)
dat2018$d_11 <- ifelse(dat2018$r11>0, 1,-1)
dat2018$d_1011 <- ifelse(dat2018$r10>0 & dat2018$r11 >0, 1, 
                     ifelse(dat2018$r10<0 & dat2018$r11 < 0, -1,0))

ddata <- dat2018[,26:28]
sapply(ddata, function(x) c("neural" = length(x[x==0]),
                            "long" = length(x[x==1]),
                            "short" = length(x[x==-1])
))

library(sandwich)
library(lmtest)
fit <- lm(dat2018$buyandhold~1)
NeweyWest(fit)
coeftest(fit, vcov = NeweyWest(fit))