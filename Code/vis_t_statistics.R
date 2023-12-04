rm(list = setdiff(ls(),lsf.str()))
library(data.table)

dat1 <- fread( "./Data/tvalues_seqrolling_500_SPY.csv")
dat2 <- fread( "./Data/tvalues_seqrolling_GAO_500_SPY.csv")

dat1 <- data.frame(dat1)
dat2 <- data.frame(dat2)

dim(dat1)
dim(dat2)

tvalues <- dat1
tvalues$r_onfh <- dat2$r_onfh

pdf("./images/tvalues_seqrolling_vis_spy.pdf", 20,5)
par(mfrow = c(1,3))
plot(tvalues$r_on, type="l", xaxt = "n", xlab = "", ylab="r_on")
plot(tvalues$r1, type="l", xaxt = "n", xlab = "", ylab="r1")
plot(tvalues$r_onfh, type="l", xaxt = "n", xlab = "", ylab="r_onfh")

dev.off()
