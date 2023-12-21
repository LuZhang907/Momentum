rm(list = setdiff(ls(),lsf.str()))
library(data.table)

# vis fix window t values
tvalues <- fread("./Data/tvalues_500_SPY.csv")
tvalues <- data.frame(tvalues)

# visualization
pdf("./images/tvalues_13lag_SPY.pdf", 5,4)

plot(tvalues$b13_lag, type="l", xaxt = "n", xlab = "", ylab="", lwd=2, ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=expression(t(r[lag])),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_on_SPY.pdf", 5,4)
plot(tvalues$b_on, type="l", xaxt = "n", xlab = "", ylab="", lwd=2, ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topright", legend=c(expression(t(r[on]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_1_SPY.pdf", 5,4)
plot(tvalues$b1, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c(expression(t(r[1]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_2_SPY.pdf", 5,4)
plot(tvalues$b2, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c(expression(t(r[2]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_3_SPY.pdf", 5,4)
plot(tvalues$b3, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topright", legend=c(expression(t(r[3]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_4_SPY.pdf", 5,4)
plot(tvalues$b4, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c(expression(t(r[4]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_5_SPY.pdf", 5,4)
plot(tvalues$b5, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topright", legend=c(expression(t(r[5]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_6_SPY.pdf", 5,4)
plot(tvalues$b6, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c(expression(t(r[6]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_7_SPY.pdf", 5,4)
plot(tvalues$b7, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c(expression(t(r[7]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_8_SPY.pdf", 5,4)
plot(tvalues$b8, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c(expression(t(r[8]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_9_SPY.pdf", 5,4)
plot(tvalues$b9, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topright", legend=c(expression(t(r[9]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_10_SPY.pdf", 5,4)
plot(tvalues$b10, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("bottomleft", legend=c(expression(t(r[10]))),
       lwd = 2, cex=1.2)
dev.off()


pdf("./images/tvalues_11_SPY.pdf", 5,4)
plot(tvalues$b11, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c(expression(t(r[11]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_12_SPY.pdf", 5,4)
plot(tvalues$b12, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("bottomleft", legend=c(expression(t(r[12]))),
       lwd = 2, cex=1.2)
dev.off()



## visualized seqrolling for r_on, r_onfh, r1

dat1 <- fread( "./Data/tvalues_seqrolling_500_SPY.csv")
dat2 <- fread( "./Data/tvalues_seqrolling_GAO_500_SPY.csv")

dat1 <- data.frame(dat1)
dat2 <- data.frame(dat2)

dim(dat1)
dim(dat2)

tvalues <- dat1
tvalues$r_onfh <- dat2$r_onfh


pdf("./images/tvalues_seqrolling_on_onfh.pdf", 5,4)
plot(tvalues$r_on, type="l", xaxt = "n", xlab = "", ylab="", col="blue",
     lwd=2, ylim = c(4.5,9))
lines(tvalues$r_onfh, lwd = 2, lty=2)
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
legend("topleft", legend=c(expression(t(r[on])), expression(t(r[onfh]))),
       lwd = c(2,2), lty = c(1,2),cex=1.2, col=c("blue","black"))
dev.off()

pdf("./images/tvalues_seqrolling_1.pdf", 5,4)
plot(tvalues$r1, type="l", xaxt = "n", xlab = "", ylab="", 
     lwd=2)
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
legend("topright", legend=expression(t(r[1])),
       lwd = 2, cex=1.2)
dev.off()
