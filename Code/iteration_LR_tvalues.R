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
my_lms <- lapply(1:n, function(x) lm(r13_mat[x,] ~ r13_lag_mat[x,]+r_on_mat[x,]+r1_mat[x,]+r2_mat[x,]+r3_mat[x,]+r4_mat[x,]+r5_mat[x,]+
                                       r6_mat[x,]+r7_mat[x,]+r8_mat[x,]+r9_mat[x,]+r10_mat[x,]+
                                       r11_mat[x,]+r12_mat[x,]))

summaries <- lapply(my_lms, summary)
#t values:
tvalues_ <- lapply(summaries, function(x) x$coefficients[, "t value"])
tvalues <- as.data.frame(do.call(rbind, tvalues_))
names(tvalues) <- c("intercept","r13_lag","r_on","r1","r2","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12")
head(tvalues)

# t critical value when p=0.05, df = n-15
qt(p=0.05/2, df = 485, lower.tail = FALSE)
#1.964867

date <- dat[(window_):dim(dat)[1],1]
tvalues$date <- as.Date(date)
tvalues$year <- format(tvalues$date, "%Y")
head(tvalues)

fwrite(tvalues, "./Data/tvalues_500_spy.csv")

# visualization
pdf("./images/r13_lag_on_1_tvalues.pdf", 6,6)
par(mfrow = c(3,1))
plot(tvalues$r13_lag, type="l", xaxt = "n", xlab = "", ylab="r13_lag")
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)

plot(tvalues$r_on, type="l", xaxt = "n", xlab = "", ylab="r_on")
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)

plot(tvalues$r1, type="l", xaxt = "n", xlab = "", ylab="r1")
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
dev.off()

pdf("./images/r234_tvalues.pdf", 6,6)
par(mfrow = c(3,1))
plot(tvalues$r2, type="l", xaxt = "n", xlab = "", ylab="r2")
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)

plot(tvalues$r3, type="l", xaxt = "n", xlab = "", ylab="r3")
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)

plot(tvalues$r4, type="l", xaxt = "n", xlab = "", ylab="r4")
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
dev.off()


pdf("./images/r567_tvalues.pdf", 6,6)
par(mfrow = c(3,1))
plot(tvalues$r5, type="l", xaxt = "n", xlab = "", ylab="r5")
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)

plot(tvalues$r6, type="l", xaxt = "n", xlab = "", ylab="r6")
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)

plot(tvalues$r7, type="l", xaxt = "n", xlab = "", ylab="r7")
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
dev.off()

pdf("./images/r8710_tvalues.pdf", 6,6)
par(mfrow = c(3,1))
plot(tvalues$r8, type="l", xaxt = "n", xlab = "", ylab="r8")
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)

plot(tvalues$r9, type="l", xaxt = "n", xlab = "", ylab="r9")
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)

plot(tvalues$r10, type="l", xaxt = "n", xlab = "", ylab="r10")
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
dev.off()

pdf("./images/r1112_tvalues.pdf", 6,6)
par(mfrow = c(3,1))
plot(tvalues$r11, type="l", xaxt = "n", xlab = "", ylab="r11")
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)

plot(tvalues$r12, type="l", xaxt = "n", xlab = "", ylab="r12")
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)

dev.off()
