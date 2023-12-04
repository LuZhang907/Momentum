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
#coef:
coe_ <- lapply(summaries, function(x) x$coefficients[, 1])
coe <- as.data.frame(do.call(rbind, coe_))
names(coe) <- c("intercept","b13_lag","b_on","b1","b2","b3","b4","b5","b6","b7","b8","b9","b10","b11","b12")
head(coe)

#r1_mat[1,][!r1_mat[1,]==999]
# t critical value when p=0.05, df = n-15
#qt(p=0.05/2, df = 485, lower.tail = FALSE)
#1.964867

# previous day's coefficient combine with current days predictors to predict r13
# thuse, shift() coefficient with 1 unit
coef <- sapply(coe, shift)
coef <- data.frame(coef)

date <- dat[(initial_window):dim(dat)[1],1]
coef$date <- as.Date(date)
coef$year <- format(coef$date, "%Y")
head(coef)



# merge coefficients and predictors
coefp <- merge(coef,dat,by="date")
coefp <- coefp%>%drop_na()
head(coefp)
#sfwrite(coef, "./Data/coef_seqrolling_500_SPY.csv")

pred13lag <- coefp$b13_lag*coefp$r13_lag+coefp$intercept
br13lag <- ifelse(pred13lag>0, dat$r13, -dat$r13)
mean(br13lag)

predon <- coefp$intercept+coefp$b13_lag*coefp$r13_lag+coefp$b_on*coefp$r_on
bron <- ifelse(predon >0, dat$r13, -dat$r13)
mean(bron)

pred1 <- coefp$intercept+coefp$b13_lag*coefp$r13_lag+coefp$b_on*coefp$r_on+coefp$b1*coefp$r1
br1 <- ifelse(pred1 >0, dat$r13, -dat$r13)
mean(br1)

pred2 <- coefp$intercept+coefp$b13_lag*coefp$r13_lag+coefp$b_on*coefp$r_on+coefp$b1*coefp$r1+coefp$b2*coefp$r2
br2 <- ifelse(pred2 >0, dat$r13, -dat$r13)
mean(br2)


pred12 <- coefp$intercept+coefp$b13_lag&coefp$r13_lag+coefp$b_on*coefp$r_on+
  coefp$b1*coefp$r1+coefp$b2*coefp$r2+coefp$b3*coefp$r3+coefp$b4*coefp$r4+
  coefp$b5*coefp$r5+coefp$b6*coefp$r6+coefp$b7*coefp$r7+coefp$b8*coefp$r8+
  coefp$b9*coefp$r9+coefp$b10*coefp$r10+coefp$b11*coefp$r11+coefp$b12*coefp$r12

#pred12 <- coefp$intercept+coefp$b12*coefp$r12
  
br12 <- ifelse(pred12>0, dat$r13, -dat$r13)
mean(br12)


preB <- ifelse(coefp$r13_lag>0, coefp$r13, -coefp$r13)
mean(preB)

hmr13 <- data.frame(cummean(dat$r13_lag))
names(hmr13) <- c("cumM13")
hmr13$date <- dat$date

coefp <- merge(coefp,hmr13, by="date")
head(coefp)

preB <- ifelse(coefp$cumM13>0, coefp$r13, -coefp$r13)
mean(preB)
