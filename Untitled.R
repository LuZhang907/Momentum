pdf("./images/yearly_returns_onfh.pdf", 5,4)
plot(yearRet$dat.year, yearRet$cum_onfh, type = "b", frame = FALSE, pch = 19, lwd=2,
     col = "blue", xlab = "", ylab = "Yearly return", ylim = c(-0.25,1.5))
# Add a second line
lines(yearRet$dat.year, yearRet$cum_alwayslong, pch = 19, col = "black", type = "b", lwd=2)
# Add a legend to the plot
legend("topleft", legend=c(expression(eta(r[onfh])), "alwayslong"),
       col=c("blue", "black"),cex=0.8,lwd = c(2,2),pch=c(19,19))
dev.off()

#on
pdf("./images/yearly_returns_on.pdf", 5,4)
plot(yearRet$dat.year, yearRet$cum_on, type = "b", frame = FALSE, pch = 19, lwd=2,
     col = "blue", xlab = "", ylab = "Yearly return", ylim = c(-0.25,1.5))
# Add a second line
lines(yearRet$dat.year, yearRet$cum_alwayslong, pch = 19, col = "black", type = "b", lwd=2)
# Add a legend to the plot
legend("topleft", legend=c(expression(eta(r[on])), "alwayslong"),
       col=c("blue", "black"),lwd = c(2,2),pch=c(19,19),cex=0.8)
dev.off()

#12
pdf("./images/yearly_returns_12.pdf", 5,4)
plot(yearRet$dat.year, yearRet$cum_12, type = "b", frame = FALSE, pch = 19, lwd=2,
     col = "blue", xlab = "", ylab = "Yearly return", ylim = c(-0.25,1.5))
# Add a second line
lines(yearRet$dat.year, yearRet$cum_alwayslong, pch = 19, col = "black", type = "b", lwd=2)
# Add a legend to the plot
legend("topleft", legend=c(expression(eta(r[12])), "alwayslong"),
       col=c("blue", "black"),lwd = c(2,2),pch=c(19,19),cex=0.8)
dev.off()

pdf("./images/yearly_returns_13lag.pdf", 5,4)
#13lag
plot(yearRet$dat.year, yearRet$cum_lag, type = "b", frame = FALSE, pch = 19, lwd=2,
     col = "blue", xlab = "", ylab = "Yearly return", ylim = c(-0.25,1.5))
# Add a second line
lines(yearRet$dat.year, yearRet$cum_alwayslong, pch = 19, col = "black", type = "b", lwd=2)
# Add a legend to the plot
legend("topleft", legend=c(expression(eta(r[lag])), "alwayslong"),
       col=c("blue", "black"),lwd = c(2,2),pch=c(19,19),cex=0.8)

dev.off()

#onfh12
pdf("./images/yearly_returns_onfh12.pdf", 5,4)
plot(yearRet$dat.year, yearRet$cum_onfh12, type = "b", frame = FALSE, pch = 19, lwd=2,
     col = "blue", xlab = "", ylab = "Yearly return", ylim = c(-0.25,1.5))
# Add a second line
lines(yearRet$dat.year, yearRet$cum_alwayslong, pch = 19, col = "black", type = "b", lwd=2)
# Add a legend to the plot
legend("topleft", legend=c(expression(eta(r[onfh], r[12])), "alwayslong"),
       col=c("blue", "black"),lwd = c(2,2),pch=c(19,19),cex=0.8)
dev.off()

#on12
pdf("./images/yearly_returns_on12.pdf", 5,4)
plot(yearRet$dat.year, yearRet$cum_on12, type = "b", frame = FALSE, pch = 19, lwd=2,
     col = "blue", xlab = "", ylab = "Yearly return", ylim = c(-0.25,1.5))
# Add a second line
lines(yearRet$dat.year, yearRet$cum_alwayslong, pch = 19, col = "black", type = "b", lwd=2)
# Add a legend to the plot
legend("topleft", legend=c(expression(eta(r[on], r[12])), "alwayslong"),
       col=c("blue", "black"),lwd = c(2,2),pch=c(19,19),cex=0.8)
dev.off()

#lagon
pdf("./images/yearly_returns_lagon.pdf", 5,4)
plot(yearRet$dat.year, yearRet$cum_lagon, type = "b", frame = FALSE, pch = 19, lwd=2,
     col = "blue", xlab = "", ylab = "Yearly return", ylim = c(-0.25,1.5))
# Add a second line
lines(yearRet$dat.year, yearRet$cum_alwayslong, pch = 19, col = "black", type = "b", lwd=2)
# Add a legend to the plot
legend("topleft", legend=c(expression(eta(r[lag], r[on])), "alwayslong"),
       col=c("blue", "black"),lwd = c(2,2),pch=c(19,19),cex=0.8)
dev.off()

#lag12
pdf("./images/yearly_returns_lag12.pdf", 5,4)
plot(yearRet$dat.year, yearRet$cum_lag12, type = "b", frame = FALSE, pch = 19, lwd=2,
     col = "blue", xlab = "", ylab = "Yearly return", ylim = c(-0.25,1.5))
# Add a second line
lines(yearRet$dat.year, yearRet$cum_alwayslong, pch = 19, col = "black", type = "b", lwd=2)
# Add a legend to the plot
legend("topleft", legend=c(expression(eta(r[lag], r[12])), "alwayslong"),
       col=c("blue", "black"),lwd = c(2,2),pch=c(19,19),cex=0.8)
dev.off()

#1011
pdf("./images/yearly_returns_1011.pdf", 5,4)
plot(yearRet$dat.year, yearRet$cum_1011, type = "b", frame = FALSE, pch = 19, lwd=2,
     col = "blue", xlab = "", ylab = "Yearly return", ylim = c(-0.25,1.5))
# Add a second line
lines(yearRet$dat.year, yearRet$cum_alwayslong, pch = 19, col = "black", type = "b", lwd=2)
# Add a legend to the plot
legend("topleft", legend=c(expression(eta(r[10], r[11])), "alwayslong"),
       col=c("blue", "black"),lwd = c(2,2),pch=c(19,19),cex=0.8)
dev.off()

# buyand hold
pdf("./images/yearly_returns_buyandhold.pdf", 5,4)
plot(yearRet$dat.year, yearRet$cum_buyandhold, type = "b", frame = FALSE, pch = 19, lwd=2,
     col = "blue", xlab = "", ylab = "Yearly return", ylim = c(-0.25,1.5))
# Add a second line
lines(yearRet$dat.year, yearRet$cum_alwayslong, pch = 19, col = "black", type = "b", lwd=2)
# Add a legend to the plot
legend("topleft", legend=c("buyandhold", "alwayslong"),
       col=c("blue", "black"),lwd = c(2,2),pch=c(19,19),cex=0.8)
dev.off()





