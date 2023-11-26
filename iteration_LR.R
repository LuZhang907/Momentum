library(data.table)
library(Rcpp)
library(tidyr)
sourceCpp("./Code/iteration_matrix_generating.cpp", verbose = F, rebuild = T)

dat <- fread("./Data/returns_spy.csv")
dat <- data.frame(dat)
dat <- dat %>% drop_na()
head(dat)
dim(dat)



r1_mat <- iter_r1(dat,window = 360)
r2_mat <- iter_r2(dat,window = 360)
r3_mat <- iter_r3(dat,window = 360)
r4_mat <- iter_r4(dat,window = 360)
r5_mat <- iter_r5(dat,window = 360)

r6_mat <- iter_r6(dat,window = 360)
r7_mat <- iter_r7(dat,window = 360)
r8_mat <- iter_r8(dat,window = 360)
r9_mat <- iter_r9(dat,window = 360)
r10_mat <- iter_r10(dat,window = 360)


r11_mat <- iter_r11(dat,window = 360)
r12_mat <- iter_r12(dat,window = 360)
r13_mat <- iter_r13(dat,window = 360)
r_on_mat <- iter_r_on(dat,window = 360)
r13_lag_mat <- iter_r13_lag(dat,window = 360)

# number of iterations
n <- dim(r1_mat)[1]

# run n regressions
my_lms <- lapply(1:n, function(x) lm(r13_mat[x,] ~ r1_mat[x,]+r2_mat[x,]+r3_mat[x,]+r4_mat[x,]+r5_mat[x,]+
                                       r6_mat[x,]+r7_mat[x,]+r8_mat[x,]+r9_mat[x,]+r10_mat[x,]+
                                       r11_mat[x,]+r12_mat[x,]+r_on_mat[x,]+r13_lag_mat[x,]))

# extract coefficients
coef <- data.frame(sapply(my_lms, coef))
coef <- transpose(coef)
names(coef) <- c("intercept","r1","r2","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12","r_on","r13_lag")

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

coef$r2 <- r2$V1
coef$adjr2 <- r2$V2

fwrite(coef, "./Data/iter_coefs.csv")
