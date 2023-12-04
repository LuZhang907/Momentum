rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(Rcpp)
library(tidyr)
library(tidyverse)
library(dplyr)

sourceCpp("./Code/iteration_matrix_generating_seqrolling.cpp", verbose = F, rebuild = T)

dat <- fread("./Data/returns_SPY.csv")
dat <- data.frame(dat)
dat <- dat %>% drop_na()
head(dat)
dim(dat)

r_onfh <- fread("./Data/r_onfh_SPY.csv")
r_onfh <- data.frame(r_onfh)
r_onfh <- r_onfh %>% drop_na()
head(r_onfh)
dim(r_onfh)

dat <- merge(dat, r_onfh, by = "date")

#fwrite(dat,"./Data/returns_Gao_SPY.csv")

initial_window = 500
r2_mat <- iter_r2(dat,window = initial_window)
r3_mat <- iter_r3(dat,window = initial_window)
r4_mat <- iter_r4(dat,window = initial_window)
r5_mat <- iter_r5(dat,window = initial_window)

r6_mat <- iter_r6(dat,window = initial_window)
r7_mat <- iter_r7(dat,window = initial_window)
r8_mat <- iter_r8(dat,window = initial_window)
r9_mat <- iter_r9(dat,window = initial_window)
r10_mat <- iter_r10(dat,window = initial_window)


r11_mat <- iter_r11(dat,window = initial_window)
r12_mat <- iter_r12(dat,window = initial_window)
r13_mat <- iter_r13(dat,window = initial_window)
r_onfh_mat <- iter_r_onfh(dat,window = initial_window)
r13_lag_mat <- iter_r13_lag(dat,window = initial_window)

# number of iterations
n <- dim(r13_lag_mat)[1]

# run n regressions
my_lms <- lapply(1:n, function(x) lm(r13_mat[x,][!r13_mat[x,]==999] ~ r13_lag_mat[x,][!r13_lag_mat[x,]==999]+
                                       r_onfh_mat[x,][!r_onfh_mat[x,]==999]+
                                       r2_mat[x,][!r2_mat[x,]==999]+
                                       r3_mat[x,][!r3_mat[x,]==999]+r4_mat[x,][!r4_mat[x,]==999]+
                                       r5_mat[x,][!r5_mat[x,]==999]+r6_mat[x,][!r6_mat[x,]==999]+
                                       r7_mat[x,][!r7_mat[x,]==999]+r8_mat[x,][!r8_mat[x,]==999]+
                                       r9_mat[x,][!r9_mat[x,]==999]+r10_mat[x,][!r10_mat[x,]==999]+
                                       r11_mat[x,][!r11_mat[x,]==999]+r12_mat[x,][!r2_mat[x,]==999]))

summaries <- lapply(my_lms, summary)
#t values:
coef_ <- lapply(summaries, function(x) x$coefficients[, 1])
coef <- as.data.frame(do.call(rbind, coef_))
names(coef) <- c("intercept","r13_lag","r_onfh","r2","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12")
head(coef)

#r1_mat[1,][!r1_mat[1,]==999]
# t critical value when p=0.05, df = n-15
qt(p=0.05/2, df = 485, lower.tail = FALSE)
#1.964867

date <- dat[(initial_window):dim(dat)[1],1]
coef$date <- as.Date(date)
coef$year <- format(coef$date, "%Y")
head(coef)

fwrite(coef, "./Data/coef_seqrolling_GAO_500_SPY.csv")

# visualization
pdf("./images/coef_seqrolling_500_Gao_SPY.pdf", 12,10)
par(mfrow = c(3,5))
plot(coef$r13_lag, type="l", ylab="r13_lag", xaxt = "n", xlab = "",)
plot(coef$r_onfh, type="l", xaxt = "n", xlab = "", ylab="r_onfh")
plot(coef$r2, type="l", xaxt = "n", xlab = "", ylab="r2")
plot(coef$r3, type="l", xaxt = "n", xlab = "", ylab="r3")

plot(coef$r4, type="l", xaxt = "n", xlab = "", ylab="r4")
plot(coef$r5, type="l", xaxt = "n", xlab = "", ylab="r5")
plot(coef$r6, type="l", xaxt = "n", xlab = "", ylab="r6")
plot(coef$r7, type="l", xaxt = "n", xlab = "", ylab="r7")
plot(coef$r8, type="l", xaxt = "n", xlab = "", ylab="r8")

plot(coef$r9, type="l", xaxt = "n", xlab = "", ylab="r9")
plot(coef$r10, type="l", xaxt = "n", xlab = "", ylab="r10")
plot(coef$r11, type="l", xaxt = "n", xlab = "", ylab="r11")
plot(coef$r12, type="l", xaxt = "n", xlab = "", ylab="r12")

dev.off()

