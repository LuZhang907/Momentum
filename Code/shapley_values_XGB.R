rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(tidyr)
library(dplyr)
library(shapr)
library(MASS)
library(xgboost)

dat <- fread("./Data/returns_spy.csv")
dat <- data.frame(dat)
dat <- dat %>% drop_na()

n <- dim(dat)[1]

x_var <- c("r13_lag","r_on","r1","r2","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12")
y_var <- "r13"

x_train <- as.matrix(dat[1:(n-8),x_var])
y_train <- dat[1:(n-8), y_var]
x_test <-  as.matrix(dat[(n-7):n,x_var])

x_train_scaled <- scale(x_train)
x_test_scaled <- scale(x_test, center = attr(x_train_scaled,"scaled:center"),
                       scale = attr(x_train_scaled,"scaled:scale"))

model <- xgboost(
  data = x_train_scaled,
  label = y_train,
  nrounds = 20,
  verbose = FALSE
)

explainer <- shapr(x_train_scaled,model,n_combinations = 2^7)

p <- mean(dat[1:(n-8),"r13"])

explanation <- explain(
  x_test_scaled, 
  approach = "empirical", 
  explainer = explainer,
  prediction_zero = p
  )

print(explanation$dt)

pdf("./images/OS_xgb_spy.pdf", 12,12)
plot(explanation, plot_phi0 = FALSE, index_x_test = c(1, 2,3,4,5,6,7,8))
dev.off()


y_test <- dat[(n-7):n, "r13"]
y_predict <- predict(model,x_test_scaled)
y_avg <- rep(mean(y_test), 8)
OOSR2 <- 1 - (sum((y_test-y_predict)**2))/(sum((y_test-y_avg)**2))
OOSR2


results <- data.frame(y_test, y_predict, y_avg)
fwrite(results,"./results/test_vs_predicted_spy_xgb.csv")



