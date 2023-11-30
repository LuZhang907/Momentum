rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(tidyr)

returns <- fread("./Data/returns_Gao_SPY.csv")
returns <- data.frame(returns)
returns <- returns %>% drop_na()
head(returns)
dim(returns)

regime <- fread("./Data/Market_regime_SPY.csv")
regime <- data.frame(regime)
head(regime)
names(regime) <- c("date","regime")

dat <- merge(returns,regime,by="date")
head(dat)


# LR without regime 
lm1 <- lm(r13~.-r_onfh-regime,data = dat)
summary(lm1)
vif(lm1)


# LR with regime 
dat0 <- dat[dat$regime==0,]
dat1 <- dat[dat$regime==1,]
dim(dat0)
dim(dat1)

lm2 <- lm(r13~.-r_onfh-regime,data = dat0)
summary(lm2)
vif(lm2)

lm3 <- lm(r13~.-r_onfh-regime,data = dat1)
summary(lm3)
vif(lm3)



