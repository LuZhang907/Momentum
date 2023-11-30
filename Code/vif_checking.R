rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(tidyr)
library(car)

dat <- fread("./Data/returns_Gao_SPY.csv")
dat <- data.frame(dat)
dat$date <- NULL
dat <- dat %>% drop_na()

head(dat)
dim(dat)

dat1 <- dat[,!names(dat)%in%c("r_onfh")]

max.model <- lm(r13~.,data = dat1)
summary(max.model)
vif(max.model)

dat2 <- dat[,!names(dat)%in%c("r_on","r1")]

max.model <- lm(r13~.,data = dat2)
summary(max.model)
vif(max.model)


