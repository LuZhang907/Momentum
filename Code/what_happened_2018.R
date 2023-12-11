rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(flipTime)
library(dplyr)
library(stringr)
library(car)
library(lubridate)
library(ggplot2)

dat <- fread("/Users/luzhang/Desktop/minutes_data_used_in_paper/SPY.csv")
dat <- data.frame(dat)

dat$date <- as.Date(dat$time)
dat$Time <- format(dat$time, format = "%H:%M:%S")
dat$year <- format(dat$time,"%Y")
head(dat)

#subdat <- dat[(dat$date>="2007-06-01")&(dat$date<="2009-05-31"),]
subdat <- dat

dprice <- subdat %>% 
  group_by(date) %>%
  slice(n())

avgVolumn <- subdat %>%
  group_by(date) %>%
  summarise(avgVolumn = mean(volume), sumVolumn = sum(volume))

dprice <- data.frame(dprice)
avgVolumn <- data.frame(avgVolumn)

pv <- merge(dprice, avgVolumn, by = "date")

pdf("./images/dailyPriceVolumn_spy.pdf", 9,4.5)
coeff <- 10000
ggplot(data=pv, aes(x=date))+
  geom_bar(aes(y=avgVolumn/coeff),stat="identity")+
  geom_line(aes(y=close), linewidth=1)+
  scale_y_continuous(
    name="Daily close price",
    sec.axis = sec_axis(~.*coeff, name="Daily average volume")
  )+
  #theme_bw()+
  theme(axis.title.x=element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(linewidth = 0.6),
        axis.line.x.top = element_line(linewidth = 1.6))
dev.off()  

