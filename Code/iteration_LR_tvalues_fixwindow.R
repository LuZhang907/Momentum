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
names(tvalues) <- c("intercept","b13_lag","b_on","b1","b2","b3","b4","b5","b6","b7","b8","b9","b10","b11","b12")
head(tvalues)

# t critical value when p=0.05, df = n-15
qt(p=0.05/2, df = 485, lower.tail = FALSE)
#1.964867

date <- dat[(window_):dim(dat)[1],1]
tvalues$date <- as.Date(date)
tvalues$year <- format(tvalues$date, "%Y")
head(tvalues)

fwrite(tvalues, "./Data/tvalues_500_SPY.csv")

