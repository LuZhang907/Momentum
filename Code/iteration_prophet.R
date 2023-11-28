rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(Rcpp)
library(tidyr)
library(tidyverse)
library(dplyr)
library(prophet)

sourceCpp("./Code/iteration_matrix_generating.cpp", verbose = F, rebuild = T)

dat <- fread("./Data/returns_QQQ.csv")
dat <- data.frame(dat)
dat <- dat %>% drop_na()
head(dat)
dim(dat)

n <- dim(dat)[1]
window <- 500

## basic prophet arch
predictions_basicProphet <- function(data, wnd){
  window <- wnd
  n <- dim(data)[1]
  predictions <-c()
  for (i in 1:(n-window)) {
    df <- data[i:(i+500),c("date","r13")]
    names(df) <- c("ds","y")
    m <- prophet(df, daily.seasonality = FALSE,yearly.seasonality = TRUE)
    future <- make_future_dataframe(m,periods = 1)
    forecast <- predict(m, future)
    predictions[i+window] <- forecast[window+1,"yhat"]
  }
  return(predictions)
}

predicts_basic <- predictions_basicProphet(data = dat, wnd = window)
length(predicts_basic)

summary_table <- data.frame(predicts_basic[(window+1):n])
names(summary_table) <- "predicts"
summary_table$actual <- dat[(window+1):n,"r13"]
summary_table$date <- dat[(window+1):n,"date"]
summary_table$residual <- summary_table$actual-summary_table$predicts
head(summary_table)

#fwrite(summary_table,"./Data/summary_table_spy_prophet_basic.csv")

pdf("./images/actual_vs_predicts_prophet_spy.pdf", 6,6)
plot(summary_table$actual, type = "l", ylab = "returns",xlab="", xaxt = "n",col="black")
lines(summary_table$predicts,type="l",col="red")
legend("topright",legend=c("actual","predict"),col=c("black","red"),lty=c(1,1))
axis(1, c(0,500,1000,1500,2000),seq(2009,2017,2))
dev.off()


## add build in holiday 



## add extra regressor (predictors)




