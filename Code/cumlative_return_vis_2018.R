rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(tidyr)
library(moments)
library(tidyverse)
library(cowplot)
library(ggplot2)
library(ggpubr)

dat <- fread("./Data/market_timing_2018_vis_data.csv")
dat <- data.frame(dat)
dat$month <- format(dat$date, "%m")
head(dat)
tail(dat)

subdat <- dat %>% 
  select(eta10, eta11, eta1011,buyandhold, alwayslong)
head(subdat)

cumRet <- cumsum(subdat)
cumRet$index <- seq(1,dim(cumRet)[1],1)
head(cumRet)


pd <- position_dodge(width = 0.2)

longformat <- cumRet %>% 
  pivot_longer(cols = c("eta10","eta11","eta1011","buyandhold","alwayslong"),
               names_to = "strategy",
               values_to = "cumulative returns"
               )


longformat = data.frame(longformat)
head(longformat)

  
 cumRet <- longformat %>% ggplot(aes( x=index, y = cumulative.returns, group = strategy, color = strategy)) +
  geom_line(aes(linetype = strategy), position = pd) +
  scale_color_manual(values = c("red","grey","black","blue","green"))+
  scale_linetype_manual(values = c(1,2,1,1,1))+
  labs(#title = paste("Mean horsepower depending on",
    #              "number of yearinders and transmission type.",
    #              "Error bars represent 95% Confidence Intervals",
    #              sep = "\n"),
    x = "Time",
    y = "Rumulative Returns") +
  theme(
    panel.background = element_rect(fill = "white"),
    legend.key  = element_rect(fill = "white"),
    legend.position = "top",
    axis.line.x = element_line(colour = "black", linewidth =  1),
    axis.line.y = element_line(colour = "black", linewidth = 1)
  )







