rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(tidyr)
library(dplyr)
library(shapr)
library(MASS)

dat <- fread("./Data/returns_spy.csv")
dat <- data.frame(dat)
dat <- dat %>% drop_na()

dat$year <- format(dat$date, format = "%Y")
dat$date <- NULL
head(dat)

dat2007 <- subset(dat, year == "2007")
dat2007$year <- NULL
n <- dim(dat2007)[1]

data_train <- dat2007[1:(n-8),]

min.model <- lm(r13~1,data = data_train)
max.model <- lm(r13~.,data = data_train)

bwd.model <- step(max.model, direction = "backward",scope = min.model)
summary(bwd.model)

model <- lm(r13~r13_lag+r_on+r3+r5+r9,data = data_train)

x_train <- dat2007[1:(n-8),c("r13_lag","r_on","r3","r5","r9")]
x_test <-  dat2007[(n-7):n,c("r13_lag","r_on","r3","r5","r9")]
explainer <- shapr(x_train,model)


p <- mean(dat2007[1:(n-8),"r13"])

explanation <- explain(
  x_test, 
  approach = "empirical", 
  explainer = explainer,
  prediction_zero = p
  )

print(explanation$dt)

pdf("./images/OS_2007_spy.pdf", 12,6)
plot(explanation, plot_phi0 = FALSE, index_x_test = c(1, 2,3,4,5,6,7,8))
dev.off()


y_test <- dat2007[(n-7):n, "r13"]
y_predict <- predict(model,x_test)
y_avg <- rep(mean(y_test), 8)

OOSR2 <- 1 - (sum((y_test-y_predict)**2))/(sum((y_test-y_avg)**2))
