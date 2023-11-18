rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(tidyr)
library(car)

dat <- fread("./Data/returns_spy.csv")
dat <- data.frame(dat)
dat$date <- NULL
dat <- dat %>% drop_na()

head(dat)
dim(dat)

min.model <- lm(r13~1,data = dat)
max.model <- lm(r13~.,data = dat)

fwd.model <- step(min.model, direction = "forward",scope = max.model)
bwd.model <- step(max.model, direction = "backward",scope = min.model)
both.model <- step(max.model, direction = "both",scope = min.model)

summary(fwd.model)
summary(bwd.model)
summary(both.model)

vif(bwd.model)
vif(both.model)


