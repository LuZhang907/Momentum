rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(tidyr)
library(dplyr)
library(shapr)
library(MASS)

dat <- fread("./Data/returns_spy.csv")
dat <- data.frame(dat)
dat$date <- NULL
dat <- dat %>% drop_na()

head(dat)
dim(dat)

xcols <-c("r13_lag", "r_on", "r2", "r3", "r5", "r6", "r7", "r10", "r12")
df1 <- dat[,xcols]

model <- lm(r13~1+r13_lag+r_on+r2+r3+r5+r6+r7+r10+r12,data = dat)
explainer <- shapr(df1,model)
print(nrow(explainer$X))

p <- mean(dat$r13)
explanation <- explain(
  df1, 
  approach = "empirical", 
  explainer = explainer,
  prediction_zero = p
  )


