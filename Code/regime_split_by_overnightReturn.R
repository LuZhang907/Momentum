rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(Rcpp)
library(tidyr)

sourceCpp("./Code/iteration_matrix_generating.cpp", verbose = F, rebuild = T)

dat <- fread("./Data/returns_Gao_SPY.csv")
dat <- data.frame(dat)
dat <- dat %>% drop_na()
head(dat)
dim(dat)

hist(dat$r_on)

min_ <- min(dat$r_on)
max_ <- max(dat$r_on)

thres <- round(seq(min_, max_, 0.001),4)
n<- length(thres)

mr1L <- mr1_thresholdL(dat,thres)
mr1Geq <- mr1_thresholdGeq(dat,thres)

mr2L <- mr2_thresholdL(dat,thres)
mr2Geq <- mr2_thresholdGeq(dat,thres)

mr3L <- mr3_thresholdL(dat,thres)
mr3Geq <- mr3_thresholdGeq(dat,thres)

mr4L <- mr4_thresholdL(dat,thres)
mr4Geq <- mr4_thresholdGeq(dat,thres)

mr4L <- mr4_thresholdL(dat,thres)
mr4Geq <- mr4_thresholdGeq(dat,thres)

mr5L <- mr5_thresholdL(dat,thres)
mr5Geq <- mr5_thresholdGeq(dat,thres)

mr6L <- mr6_thresholdL(dat,thres)
mr6Geq <- mr6_thresholdGeq(dat,thres)

mr7L <- mr7_thresholdL(dat,thres)
mr7Geq <- mr7_thresholdGeq(dat,thres)

mr8L <- mr8_thresholdL(dat,thres)
mr8Geq <- mr8_thresholdGeq(dat,thres)

mr9L <- mr9_thresholdL(dat,thres)
mr9Geq <- mr9_thresholdGeq(dat,thres)

mr10L <- mr10_thresholdL(dat,thres)
mr10Geq <- mr10_thresholdGeq(dat,thres)

mr11L <- mr11_thresholdL(dat,thres)
mr11Geq <- mr11_thresholdGeq(dat,thres)

mr12L <- mr12_thresholdL(dat,thres)
mr12Geq <- mr12_thresholdGeq(dat,thres)

mr13L <- mr13_thresholdL(dat,thres)
mr13Geq <- mr13_thresholdGeq(dat,thres)

mr13lagL <- mr13_lag_thresholdL(dat,thres)
mr13lagGeq <- mr13_lag_thresholdGeq(dat,thres)

mronL <- mr_on_thresholdL(dat,thres)
mronGeq <- mr_on_thresholdGeq(dat,thres)

my_lmsGeq <- lapply(1:n, function(x) lm(mr13Geq[,x][!mr13Geq[,x]==999] ~ 
                                       mr1Geq[,x][!mr1Geq[,x]==999]+
                                       mr2Geq[,x][!mr2Geq[,x]==999]+
                                       mr3Geq[,x][!mr3Geq[,x]==999]+
                                       mr4Geq[,x][!mr4Geq[,x]==999]+
                                       mr5Geq[,x][!mr5Geq[,x]==999]+
                                       mr6Geq[,x][!mr6Geq[,x]==999]+
                                       mr7Geq[,x][!mr7Geq[,x]==999]+
                                       mr8Geq[,x][!mr8Geq[,x]==999]+   
                                       mr9Geq[,x][!mr9Geq[,x]==999]+
                                       mr10Geq[,x][!mr10Geq[,x]==999]+
                                       mr11Geq[,x][!mr11Geq[,x]==999]+
                                       mr12Geq[,x][!mr12Geq[,x]==999]+
                                       mr13lagGeq[,x][!mr13lagGeq[,x]==999]+ 
                                       mronGeq[,x][!mronGeq[,x]==999]
                                     ))

summaries <- lapply(my_lmsGeq, summary)

#r2Geq <- lapply(summaries, function(x) x$r.squared)
adjR2Geq <- lapply(summaries, function(x) x$adj.r.squared)
adjR2Geq <- data.frame(as.matrix(adjR2Geq))
# number of samples greater than certain thereshold
nsamples <- lapply(1:n, function(x) length(mr13Geq[,x][!mr13Geq[,x]==999]))
nsamples <- data.frame(as.matrix(nsamples))


my_lmsL <- lapply(1:n, function(x) lm(mr13L[,x][!mr13L[,x]==999] ~ 
                                        mr1L[,x][!mr1L[,x]==999]+
                                        mr2L[,x][!mr2L[,x]==999]+
                                        mr3L[,x][!mr3L[,x]==999]+
                                        mr4L[,x][!mr4L[,x]==999]+
                                        mr5L[,x][!mr5L[,x]==999]+
                                        mr6L[,x][!mr6L[,x]==999]+
                                        mr7L[,x][!mr7L[,x]==999]+
                                        mr8L[,x][!mr8L[,x]==999]+   
                                        mr9L[,x][!mr9L[,x]==999]+
                                        mr10L[,x][!mr10L[,x]==999]+
                                        mr11L[,x][!mr11L[,x]==999]+
                                        mr12L[,x][!mr12L[,x]==999]+
                                        mr13lagL[,x][!mr13lagL[,x]==999]+ 
                                        mronL[,x][!mronL[,x]==999]
))

summaries <- lapply(my_lmsL, summary)

#r2L <- lapply(summaries, function(x) x$r.squared)
adjR2L <- lapply(summaries, function(x) x$adj.r.squared)
adjR2L <- data.frame(as.matrix(adjR2L))
# number of samples less than certain thereshold
nsampleL <- lapply(1:n, function(x) length(mr13L[,x][!mr13L[,x]==999]))
nsampleL <- data.frame(as.matrix(nsampleL))

output <- data.frame(thres, adjR2Geq, nsamples, adjR2L, nsampleL)
colnames(output) <- c("threshold","adjR2Geq","#>=","adjR2L", "#<")
fwrite(output, "./Data/iteration_LR_by_overnight_threshold.csv")
