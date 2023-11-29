library(data.table)

dat1 <- fread( "./Data/tvalues_seqrolling_500_SPY.csv")
dat2 <- fread( "./Data/tvalues_seqrolling_GAO_500_SPY.csv")

dat1 <- data.frame(dat1)
dat2 <- data.frame(dat2)

dim(dat1)
dim(dat2)

tvalues <- dat1
tvalues$r_onfh <- tvalues$r_onfh

pdf("./images/tvalues_vis_SPY.pdf", 12,10)
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
plot(tvalues$r_onfh, type="l", xaxt = "n", xlab = "", ylab="r_onfh", col = "red")

dev.off()
