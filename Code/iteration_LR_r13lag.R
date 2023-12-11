rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(Rcpp)
library(tidyr)
library(tidyverse)
library(dplyr)

sourceCpp("./Code/iteration_matrix_generating.cpp", verbose = F, rebuild = T)

dat <- fread("./Data/returns_SPY.csv")
dat <- data.frame(dat)
dat <- dat %>% drop_na()
head(dat)
dim(dat)

window_ = 500
r1_mat <- iter_r1(dat,window = window_)
r2_mat <- iter_r2(dat,window = window_)
r3_mat <- iter_r3(dat,window = window_)
r4_mat <- iter_r4(dat,window = window_)
r5_mat <- iter_r5(dat,window = window_)

r6_mat <- iter_r6(dat,window = window_)
r7_mat <- iter_r7(dat,window = window_)
r8_mat <- iter_r8(dat,window = window_)
r9_mat <- iter_r9(dat,window = window_)
r10_mat <- iter_r10(dat,window = window_)


r11_mat <- iter_r11(dat,window = window_)
r12_mat <- iter_r12(dat,window = window_)
r13_mat <- iter_r13(dat,window = window_)
r_on_mat <- iter_r_on(dat,window = window_)
r13_lag_mat <- iter_r13_lag(dat,window = window_)

# number of iterations
n <- dim(r1_mat)[1]

# run n regressions
my_lms <- lapply(1:n, function(x) lm(r13_mat[x,] ~ r13_lag_mat[x,]))


summaries <- lapply(my_lms, summary)
#coefficents
coef_ <- lapply(summaries, function(x) x$coefficients[, 1])
coef <- as.data.frame(do.call(rbind, coef_))
names(coef) <- c("intercept","beta13_lag")
head(coef)

coef_table <- coef[-dim(coef)[1],]# remove the last row
dim(coef_table)

date <- dat[(window_+1):dim(dat)[1],1]
test <- dat[(window_+1):dim(dat)[1],c(-1,-16)] # remove date, and r13
head(test)
dim(test)

betar13lag <- coef_table["beta13_lag"]*test["r13_lag"]

names(predicts) <- c("predicts")

coef_table$predicts <- predicts$predicts
coef_table$actual <- dat[(window_+1):dim(dat)[1],16]
coef_table$residual <- coef_table$actual-coef_table$predicts
coef_table$date <- as.Date(date)
coef_table$year <- format(coef_table$date, "%Y")
coef_table$month <- format(coef_table$date,"%m")
head(coef_table)


pdf("./images/actual_vs_predicts_LR_spy.pdf", 6,6)
plot(coef_table$actual, type = "l", ylab = "returns",xlab="", xaxt = "n",col="black")
lines(coef_table$predicts,type="l",col="red")
legend("topright",legend=c("actual","predict"),col=c("black","red"),lty=c(1,1))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
dev.off()

pdf("./images/daily_residuals_spy.pdf", 6,6)
plot(coef_table$residual, type = "l", ylab = "residual (daily)",xlab="", xaxt = "n")
abline(h=0, col="red", lty = 2)
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
dev.off()

sresidual <- coef_table %>% 
  group_by(year, month) %>%
  summarise(se = sum(residual))
sresidual <- data.frame(sresidual)
head(sresidual)


pdf("./images/montyly_residuals_spy.pdf", 6,6)
plot(sresidual$se, type = "l", ylab = "sum of residual (monthly)", xlab="", xaxt = "n")
abline(h=0, col="red", lty = 2)
axis(1, c(0,20,40,60,80,100),c(2009,2011,2012,2014,2016,2017))
dev.off()

fwrite(coef_table, "./Data/iter_coefs_and_predicts_500.csv")
