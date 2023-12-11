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

initial_window = 500
r1_mat <- iter_r1(dat,window = initial_window)
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
r_on_mat <- iter_r_on(dat,window = initial_window)
r13_lag_mat <- iter_r13_lag(dat,window = initial_window)

# number of iterations
n <- dim(r1_mat)[1]

# run n regressions
my_lms <- lapply(1:n, function(x) lm(r13_mat[x,][!r13_mat[x,]==999] ~ r13_lag_mat[x,][!r13_lag_mat[x,]==999]+r_on_mat[x,][!r_on_mat[x,]==999]+
                                       r1_mat[x,][!r1_mat[x,]==999]+r2_mat[x,][!r2_mat[x,]==999]+
                                       r3_mat[x,][!r3_mat[x,]==999]+r4_mat[x,][!r4_mat[x,]==999]+
                                       r5_mat[x,][!r5_mat[x,]==999]+r6_mat[x,][!r6_mat[x,]==999]+
                                       r7_mat[x,][!r7_mat[x,]==999]+r8_mat[x,][!r8_mat[x,]==999]+
                                       r9_mat[x,][!r9_mat[x,]==999]+r10_mat[x,][!r10_mat[x,]==999]+
                                       r11_mat[x,][!r11_mat[x,]==999]+r12_mat[x,][!r2_mat[x,]==999]))

summaries <- lapply(my_lms, summary)
#t values:
tvalues_ <- lapply(summaries, function(x) x$coefficients[, "t value"])
tvalues <- as.data.frame(do.call(rbind, tvalues_))
names(tvalues) <- c("intercept","r13_lag","r_on","r1","r2","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12")
head(tvalues)

#r1_mat[1,][!r1_mat[1,]==999]
# t critical value when p=0.05, df = n-15
qt(p=0.05/2, df = 485, lower.tail = FALSE)
#1.964867

date <- dat[(initial_window):dim(dat)[1],1]
tvalues$date <- as.Date(date)
tvalues$year <- format(tvalues$date, "%Y")
head(tvalues)

fwrite(tvalues, "./Data/tvalues_seqrolling_500_SPY.csv")

# visualization
pdf("./images/tvalues_seqrolling_500_SPY.pdf", 12,10)
par(mfrow = c(3,5))
plot(tvalues$r13_lag, type="l", ylab="r13_lag", xaxt = "n", xlab = "",)
plot(tvalues$r_on, type="l", xaxt = "n", xlab = "", ylab="r_on")
plot(tvalues$r1, type="l", xaxt = "n", xlab = "", ylab="r1")
plot(tvalues$r2, type="l", xaxt = "n", xlab = "", ylab="r2")
plot(tvalues$r3, type="l", xaxt = "n", xlab = "", ylab="r3")

plot(tvalues$r4, type="l", xaxt = "n", xlab = "", ylab="r4")
plot(tvalues$r5, type="l", xaxt = "n", xlab = "", ylab="r5")
plot(tvalues$r6, type="l", xaxt = "n", xlab = "", ylab="r6")
plot(tvalues$r7, type="l", xaxt = "n", xlab = "", ylab="r7")
plot(tvalues$r8, type="l", xaxt = "n", xlab = "", ylab="r8")

plot(tvalues$r9, type="l", xaxt = "n", xlab = "", ylab="r9")
plot(tvalues$r10, type="l", xaxt = "n", xlab = "", ylab="r10")
plot(tvalues$r11, type="l", xaxt = "n", xlab = "", ylab="r11")
plot(tvalues$r12, type="l", xaxt = "n", xlab = "", ylab="r12")

dev.off()

