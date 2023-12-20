rm(list = setdiff(ls(),lsf.str()))
library(data.table)

# vis fix window t values
tvalues <- fread("./Data/tvalues_500_SPY_with_vix_usd.csv")
tvalues <- data.frame(tvalues)

# visualization
pdf("./images/tvalues_13lag_vixusd_SPY.pdf", 5,4)
plot(tvalues$b13_lag, type="l", xaxt = "n", xlab = "", ylab="", lwd=2, ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=expression(t(r[lag])),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_on_vixusd_SPY.pdf", 5,4)
plot(tvalues$b_on, type="l", xaxt = "n", xlab = "", ylab="", lwd=2, ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topright", legend=c(expression(t(r[on]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_1_vixusd_SPY.pdf", 5,4)
plot(tvalues$b1, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c(expression(t(r[1]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_2_vixusd_SPY.pdf", 5,4)
plot(tvalues$b2, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c(expression(t(r[2]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_3_vixusd_SPY.pdf", 5,4)
plot(tvalues$b3, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topright", legend=c(expression(t(r[3]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_4_vixusd_SPY.pdf", 5,4)
plot(tvalues$b4, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c(expression(t(r[4]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_5_vixusd_SPY.pdf", 5,4)
plot(tvalues$b5, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topright", legend=c(expression(t(r[5]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_6_vixusd_SPY.pdf", 5,4)
plot(tvalues$b6, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c(expression(t(r[6]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_7_vixusd_SPY.pdf", 5,4)
plot(tvalues$b7, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c(expression(t(r[7]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_8_vixusd_SPY.pdf", 5,4)
plot(tvalues$b8, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c(expression(t(r[8]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_9_vixusd_SPY.pdf", 5,4)
plot(tvalues$b9, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topright", legend=c(expression(t(r[9]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_10_vixusd_SPY.pdf", 5,4)
plot(tvalues$b10, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("bottomleft", legend=c(expression(t(r[10]))),
       lwd = 2, cex=1.2)
dev.off()


pdf("./images/tvalues_11_vixusd_SPY.pdf", 5,4)
plot(tvalues$b11, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c(expression(t(r[11]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_12_vixusd_SPY.pdf", 5,4)
plot(tvalues$b12, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("bottomleft", legend=c(expression(t(r[12]))),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_vixlag_vixusd_SPY.pdf", 5,4)
plot(tvalues$vixlag, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c("vixlag"),
       lwd = 2, cex=1.2)
dev.off()


pdf("./images/tvalues_vixpct_vixusd_SPY.pdf", 5,4)
plot(tvalues$vixpct, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-14,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c("vixpct"),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_vixpctlag_vixusd_SPY.pdf", 5,4)
plot(tvalues$vixpctlag, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c("vixpctlag"),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_usdlag_vixusd_SPY.pdf", 5,4)
plot(tvalues$usdlag, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c("usdlag"),
       lwd = 2, cex=1.2)
dev.off()


pdf("./images/tvalues_usdpct_vixusd_SPY.pdf", 5,4)
plot(tvalues$usdpct, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c("usdpct"),
       lwd = 2, cex=1.2)
dev.off()

pdf("./images/tvalues_usdpctlag_vixusd_SPY.pdf", 5,4)
plot(tvalues$usdpctlag, type="l", xaxt = "n", xlab = "", ylab="", lwd=2,ylim=c(-7,7))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
abline(h=1.96, col="red", lty=2)
abline(h=-1.96, col = "red",lty=2)
legend("topleft", legend=c("usdpctlag"),
       lwd = 2, cex=1.2)
dev.off()



