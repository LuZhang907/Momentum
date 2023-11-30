rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(tidyr)
library(car)
library(Rcpp)
library(moments)

dat <- fread("./Data/returns_Gao_SPY.csv")
dat <- data.frame(dat)
dat <- dat %>% drop_na()
head(dat)
dim(dat)

r_buyandhold <- fread("./Data/r_buy_and_hold_SPY.csv")
r_buyandhold <- data.frame(r_buyandhold)
dim(r_buyandhold)

dat <- merge(dat, r_buyandhold, by = "date")
dim(dat)
head(dat)
dat$etaonfh <- ifelse(dat$r_onfh>0, dat$r13, -dat$r13)
dat$etaonfh12 <- ifelse(dat$r_onfh>0 & dat$r12>0, dat$r13, 
                     ifelse(dat$r_onfh<0 & dat$r12<0, -dat$r13, 0))


dat$etaon <- ifelse(dat$r_on>0, dat$r13, -dat$r13)
dat$eta12 <- ifelse(dat$r12>0, dat$r13, -dat$r13)

dat$etaon12 <- ifelse(dat$r_on>0 & dat$r12>0, dat$r13, 
                     ifelse(dat$r_on<0 & dat$r12<0, -dat$r13, 0))


dat$etalag <- ifelse(dat$r13_lag<0, dat$r13, -dat$r13)
dat$etalagon <- ifelse(dat$r_on>0 & dat$r13_lag<0, dat$r13, 
                     ifelse(dat$r_on<0 & dat$r13_lag>0, -dat$r13, 0))


dat$etalag12 <- ifelse(dat$r12>0 & dat$r13_lag<0, dat$r13, 
                       ifelse(dat$r12<0 & dat$r13_lag>0, -dat$r13, 0))


dat$alwayslong <- dat$r13
dat$buyandhold <- dat$r_daily

date_ <- dat$date
dat$date <- NULL


#new strategy with PCA
library(PCAmixdata)
vars <- dat[,c("r13_lag","r_on","r3","r7","r12")]
pcamix <- PCAmix(X.quanti=vars,  ndim=5)
plot(pcamix$eig[,1]) # choose above ndim based on this plot




plot(pcamix, choice="cor", main="Numerical variables")

pdf("./images/pca_vis_SPY.pdf", 12,4)
par(mfrow = c(1,3))
plot(pcamix, choice="cor",main="",axes = c(1,2))
plot(pcamix, choice="cor",main="",axes = c(1,3))
plot(pcamix, choice="cor", main="",axes = c(2,3))
dev.off()

pcamixs <- pcamix$ind$coord
pcamixs <- data.frame(pcamixs)
names(pcamixs) <- paste0("dim",1:5)
pcamixs$r13 <- dat$r13

# re-iteration with PCA predictors
sourceCpp("./Code/iteration_matrix_generating_seqrolling.cpp", verbose = F, rebuild = T)

initial_window = 500
dim1_mat <- iter_dim1(pcamixs,window = initial_window)
dim2_mat <- iter_dim2(pcamixs,window = initial_window)
dim3_mat <- iter_dim3(pcamixs,window = initial_window)
dim4_mat <- iter_dim4(pcamixs,window = initial_window)
dim5_mat <- iter_dim5(pcamixs,window = initial_window)

r13_mat <- iter_r13(pcamixs,window = initial_window)

n <- dim(r13_mat)[1]

# run n regressions
my_lms <- lapply(1:n, function(x) lm(r13_mat[x,][!r13_mat[x,]==999] ~ dim1_mat[x,][!dim1_mat[x,]==999]+
                                       dim2_mat[x,][!dim2_mat[x,]==999]+
                                       dim3_mat[x,][!dim3_mat[x,]==999]+
                                       dim4_mat[x,][!dim4_mat[x,]==999]+
                                       dim5_mat[x,][!dim5_mat[x,]==999]))

summaries <- lapply(my_lms, summary)
#t values:
tvalues_ <- lapply(summaries, function(x) x$coefficients[, "t value"])
tvalues <- as.data.frame(do.call(rbind, tvalues_))
names(tvalues) <- c("intercept","dim1","dim2","dim3","dim4","dim5")
head(tvalues)

fwrite(tvalues, "./Data/tvalues_pca_seqrolling_500_SPY.csv")

# visualization
pdf("./images/tvalues_seqrolling_pca_500_SPY.pdf", 12,4)
par(mfrow = c(1,5))
plot(tvalues$dim1, type="l", xaxt = "n", xlab = "", ylab="dim1")
plot(tvalues$dim2, type="l", xaxt = "n", xlab = "", ylab="dim2")
plot(tvalues$dim3, type="l", xaxt = "n", xlab = "", ylab="dim3")
plot(tvalues$dim4, type="l", xaxt = "n", xlab = "", ylab="dim4")
plot(tvalues$dim5, type="l", xaxt = "n", xlab = "", ylab="dim5")


dev.off()


# market timing based on dim1, dim2 and dim3

dat$etadim1 <- ifelse(pcamixs$dim1<0, pcamixs$r13, -pcamixs$r13)
dat$etadim2 <- ifelse(pcamixs$dim2>0, pcamixs$r13, -pcamixs$r13)
dat$etadim3 <- ifelse(pcamixs$dim3>0, pcamixs$r13, -pcamixs$r13)

dat$etadim23 <- ifelse(pcamixs$dim2>0 & pcamixs$dim3>0, pcamixs$r13, 
                     ifelse(pcamixs$dim2<0 & pcamixs$dim3<0, -pcamixs$r13, 0))

sapply(dat, function(x) c("avg ret" = round(mean(x)*100,4),
                          "stand dev" = round(sd(x)*100,4),
                          "skewness" = round(skewness(x),4),
                          "kurtosis" = round(kurtosis(x),4),
                          "success" = round(length(x[x>=0])/dim(dat)[1]*100,2)
                          
))

#dat$date <- date_
#fwrite(dat, "./Data/market_timing_vis_data.csv")
# newey west t test
library(sandwich)
library(lmtest)
fit <- lm(dat$buyandhold~1)
NeweyWest(fit)
coeftest(fit, vcov = NeweyWest(fit))


