rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(Rcpp)
library(tidyr)
sourceCpp("./Code/iteration_matrix_generating.cpp", verbose = F, rebuild = T)

dat <- fread("./Data/returns_SPY.csv")
dat <- data.frame(dat)
dat <- dat %>% drop_na()
head(dat)
dim(dat)

window_ = 540
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

# extract coefficients
coef <- data.frame(sapply(my_lms, coef))
coef <- transpose(coef)
names(coef) <- c("intercept","r13_lag","r_on","r1","r2","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12")

summaries <- lapply(my_lms, summary)
# ...coefficents with p values:
#lapply(summaries, function(x) x$coefficients[, c(1,4)])
# ...or r-squared values
r2 <- sapply(summaries, function(x) c(r_sq = x$r.squared, 
                                adj_r_sq = x$adj.r.squared))
r2 <- transpose(data.frame(r2))

head(r2)
plot(r2$V1,type="l")
plot(r2$V2,type="l")

coef$R2 <- r2$V1
coef$adjR2 <- r2$V2

#fwrite(coef, "./Data/iter_coefs.csv")

coef_table <- coef[-dim(coef)[1],]# remove the last row
dim(coef_table)

date <- dat[(window_+1):dim(dat)[1],1]
test <- dat[(window_+1):dim(dat)[1],c(-1,-16)] # remove date, and r13
head(test)
dim(test)

predicts <- coef_table["intercept"]+coef_table["r13_lag"]*test["r13_lag"]+
  coef_table["r_on"]*test["r_on"]+coef_table["r1"]*test["r1"]+coef_table["r2"]*test["r2"]+
  coef_table["r3"]*test["r3"]+coef_table["r4"]*test["r4"]+coef_table["r5"]*test["r5"]+
  coef_table["r6"]*test["r6"]+coef_table["r7"]*test["r7"]+coef_table["r8"]*test["r8"]+
  coef_table["r9"]*test["r9"]+coef_table["r10"]*test["r10"]+coef_table["r11"]*test["r11"]+
  coef_table["r12"]*test["r12"]

names(predicts) <- c("predicts")
  
coef_table$predicts <- predicts$predicts
coef_table$actual <- dat[(window_+1):dim(dat)[1],16]
coef_table$residual <- coef_table$actual-coef_table$predicts
coef_table$date <- as.Date(date)
coef_table$year <- format(coef_table$date, "%Y")
coef_table$month <- format(coef_table$date,"%m")
head(coef_table)

fwrite(coef_table, "./Data/iter_coefs_and_predicts_540.csv")
