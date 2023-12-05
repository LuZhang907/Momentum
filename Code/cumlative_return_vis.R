rm(list = setdiff(ls(),lsf.str()))
library(data.table)
library(tidyr)
library(moments)
library(tidyverse)
library(cowplot)
library(ggplot2)
library(ggpubr)

dat <- fread("./Data/market_timing_vis_data.csv")
dat <- data.frame(dat)
dat$year <- format(dat$date, "%Y")
dat$month <- format(dat$date, "%m")

head(dat)

subdat <- dat %>% 
  select( etaonfh, eta12,etaonfh12, etaon,etaon12,etalag,etalag12, 
          etalagon, eta1011, etalagon12,buyandhold, alwayslong)
head(subdat)

cumRet <- cumsum(subdat)
cumRet$index <- seq(1,dim(cumRet)[1],1)
head(cumRet)


pd <- position_dodge(width = 0.2)

longformat <- cumRet %>% 
  pivot_longer(cols = c("etaonfh", "eta12","etaonfh12", "etaon","etaon12","etalag","etalag12", 
                        "etalagon", "eta1011", "etalagon12","buyandhold", "alwayslong"),
               names_to = "strategy",
               values_to = "cumulative returns"
               )


longformat = data.frame(longformat)
head(longformat)

  
cumRet <- longformat %>% ggplot(aes( x=index, y = cumulative.returns, group = strategy, color = strategy)) +
  geom_line(aes(linetype = strategy), position = pd) +
  scale_color_manual(values = c("red","grey","black","pink","purple","brown",
                                "pink","orange","darkgreen","yellow","blue","green"))+
  scale_linetype_manual(values = c(1,2,1,2,2,2,1,1,1,1,1,1))+
  labs(#title = paste("Mean horsepower depending on",
    #              "number of yearinders and transmission type.",
    #              "Error bars represent 95% Confidence Intervals",
    #              sep = "\n"),
    x = "Time",
    y = "Rumulative Returns") +
  theme(
    panel.background = element_rect(fill = "white"),
    legend.key  = element_rect(fill = "white"),
    legend.position = "right",
    axis.line.x = element_line(colour = "black", linewidth =  1),
    axis.line.y = element_line(colour = "black", linewidth = 1)
  )

sonfh <- dat %>% 
  select(year, etaonfh,alwayslong) %>% 
  pivot_longer(cols=c('etaonfh', 'alwayslong'),
                    names_to='strategy',
                    values_to='returns') %>%
  group_by(year, strategy) %>%
  summarise(avg_ret = sum(returns),
            ret_ci   = 1.96 * sd(returns)/sqrt(n())) %>%
  ggplot(aes(x = year, y = avg_ret, group = strategy)) +
  geom_line(aes(linetype = strategy), position = pd) +
  scale_linetype_manual(values=c(2, 1))+
  geom_hline(yintercept=0, linetype=3, 
             color = "red")+
  geom_errorbar(aes(ymin = avg_ret - ret_ci, ymax = avg_ret + ret_ci),
                width = .1, position = pd, linetype = 1) +
  geom_point(size = 1, position = pd) +
  geom_point(size = 1, position = pd, color = "white") +
  guides(linetype = guide_legend("strategy")) +
  labs(#title = paste("Mean horsepower depending on",
       #              "number of yearinders and transmission type.",
       #              "Error bars represent 95% Confidence Intervals",
       #              sep = "\n"),
       x = "Year",
       y = "Yearly returns") +
  theme(
    panel.background = element_rect(fill = "white"),
    legend.key  = element_rect(fill = "white"),
    legend.position = "top",
    axis.line.x = element_line(colour = "black", linewidth =  1),
    axis.line.y = element_line(colour = "black", linewidth = 1)
  )

s12 <- dat %>% 
  select(year, eta12,alwayslong) %>% 
  pivot_longer(cols=c('eta12', 'alwayslong'),
               names_to='strategy',
               values_to='returns') %>%
  group_by(year, strategy) %>%
  summarise(avg_ret = sum(returns),
            ret_ci   = 1.96 * sd(returns)/sqrt(n())) %>%
  ggplot(aes(x = year, y = avg_ret, group = strategy)) +
  geom_line(aes(linetype = strategy), position = pd) +
  scale_linetype_manual(values=c(2, 1))+
  geom_hline(yintercept=0, linetype=3, 
             color = "red")+
  geom_errorbar(aes(ymin = avg_ret - ret_ci, ymax = avg_ret + ret_ci),
                width = .1, position = pd, linetype = 1) +
  geom_point(size = 1, position = pd) +
  geom_point(size = 1, position = pd, color = "white") +
  guides(linetype = guide_legend("strategy")) +
  labs(#title = paste("Mean horsepower depending on",
    #              "number of yearinders and transmission type.",
    #              "Error bars represent 95% Confidence Intervals",
    #              sep = "\n"),
    x = "Year",
    y = "Yearly returns") +
  theme(
    panel.background = element_rect(fill = "white"),
    legend.key  = element_rect(fill = "white"),
    legend.position = "top",
    axis.line.x = element_line(colour = "black", linewidth =  1),
    axis.line.y = element_line(colour = "black", linewidth = 1)
  )

sonfh12 <- dat %>% 
  select(year, etaonfh12,alwayslong) %>% 
  pivot_longer(cols=c('etaonfh12', 'alwayslong'),
               names_to='strategy',
               values_to='returns') %>%
  group_by(year, strategy) %>%
  summarise(avg_ret = sum(returns),
            ret_ci   = 1.96 * sd(returns)/sqrt(n())) %>%
  ggplot(aes(x = year, y = avg_ret, group = strategy)) +
  geom_line(aes(linetype = strategy), position = pd) +
  scale_linetype_manual(values=c(2, 1))+
  geom_hline(yintercept=0, linetype=3, 
             color = "red")+
  geom_errorbar(aes(ymin = avg_ret - ret_ci, ymax = avg_ret + ret_ci),
                width = .1, position = pd, linetype = 1) +
  geom_point(size = 1, position = pd) +
  geom_point(size = 1, position = pd, color = "white") +
  guides(linetype = guide_legend("strategy")) +
  labs(#title = paste("Mean horsepower depending on",
    #              "number of yearinders and transmission type.",
    #              "Error bars represent 95% Confidence Intervals",
    #              sep = "\n"),
    x = "Year",
    y = "Yearly returns") +
  theme(
    panel.background = element_rect(fill = "white"),
    legend.key  = element_rect(fill = "white"),
    legend.position = "top",
    axis.line.x = element_line(colour = "black", linewidth =  1),
    axis.line.y = element_line(colour = "black", linewidth = 1)
  )

son <- dat %>% 
  select(year, etaon,alwayslong) %>% 
  pivot_longer(cols=c('etaon', 'alwayslong'),
               names_to='strategy',
               values_to='returns') %>%
  group_by(year, strategy) %>%
  summarise(avg_ret = sum(returns),
            ret_ci   = 1.96 * sd(returns)/sqrt(n())) %>%
  ggplot(aes(x = year, y = avg_ret, group = strategy)) +
  geom_line(aes(linetype = strategy), position = pd) +
  scale_linetype_manual(values=c(2, 1))+
  geom_hline(yintercept=0, linetype=3, 
             color = "red")+
  geom_errorbar(aes(ymin = avg_ret - ret_ci, ymax = avg_ret + ret_ci),
                width = .1, position = pd, linetype = 1) +
  geom_point(size = 1, position = pd) +
  geom_point(size = 1, position = pd, color = "white") +
  guides(linetype = guide_legend("strategy")) +
  labs(#title = paste("Mean horsepower depending on",
    #              "number of yearinders and transmission type.",
    #              "Error bars represent 95% Confidence Intervals",
    #              sep = "\n"),
    x = "Year",
    y = "Yearly returns") +
  theme(
    panel.background = element_rect(fill = "white"),
    legend.key  = element_rect(fill = "white"),
    legend.position = "top",
    axis.line.x = element_line(colour = "black", linewidth = 1),
    axis.line.y = element_line(colour = "black", linewidth = 1)
  )

son12 <- dat %>% 
  select(year, etaon12,alwayslong) %>% 
  pivot_longer(cols=c('etaon12', 'alwayslong'),
               names_to='strategy',
               values_to='returns') %>%
  group_by(year, strategy) %>%
  summarise(avg_ret = sum(returns),
            ret_ci   = 1.96 * sd(returns)/sqrt(n())) %>%
  ggplot(aes(x = year, y = avg_ret, group = strategy)) +
  geom_line(aes(linetype = strategy), position = pd) +
  scale_linetype_manual(values=c(2, 1))+
  geom_hline(yintercept=0, linetype=3, 
             color = "red")+
  geom_errorbar(aes(ymin = avg_ret - ret_ci, ymax = avg_ret + ret_ci),
                width = .1, position = pd, linetype = 1) +
  geom_point(size = 1, position = pd) +
  geom_point(size = 1, position = pd, color = "white") +
  guides(linetype = guide_legend("strategy")) +
  labs(#title = paste("Mean horsepower depending on",
    #              "number of yearinders and transmission type.",
    #              "Error bars represent 95% Confidence Intervals",
    #              sep = "\n"),
    x = "Year",
    y = "Yearly returns") +
  theme(
    panel.background = element_rect(fill = "white"),
    legend.key  = element_rect(fill = "white"),
    legend.position = "top",
    axis.line.x = element_line(colour = "black", linewidth =  1),
    axis.line.y = element_line(colour = "black", linewidth = 1)
  )


slag <- dat %>% 
  select(year, etalag,alwayslong) %>% 
  pivot_longer(cols=c('etalag', 'alwayslong'),
               names_to='strategy',
               values_to='returns') %>%
  group_by(year, strategy) %>%
  summarise(avg_ret = sum(returns),
            ret_ci   = 1.96 * sd(returns)/sqrt(n())) %>%
  ggplot(aes(x = year, y = avg_ret, group = strategy)) +
  geom_line(aes(linetype = strategy), position = pd) +
  scale_linetype_manual(values=c(2, 1))+
  geom_hline(yintercept=0, linetype=3, 
             color = "red")+
  geom_errorbar(aes(ymin = avg_ret - ret_ci, ymax = avg_ret + ret_ci),
                width = .1, position = pd, linetype = 1) +
  geom_point(size = 1, position = pd) +
  geom_point(size = 1, position = pd, color = "white") +
  guides(linetype = guide_legend("strategy")) +
  labs(#title = paste("Mean horsepower depending on",
    #              "number of yearinders and transmission type.",
    #              "Error bars represent 95% Confidence Intervals",
    #              sep = "\n"),
    x = "Year",
    y = "Yearly returns") +
  theme(
    panel.background = element_rect(fill = "white"),
    legend.key  = element_rect(fill = "white"),
    legend.position = "top",
    axis.line.x = element_line(colour = "black", linewidth =  1),
    axis.line.y = element_line(colour = "black", linewidth = 1)
  )

slag12 <- dat %>% 
  select(year, etalag12,alwayslong) %>% 
  pivot_longer(cols=c('etalag12', 'alwayslong'),
               names_to='strategy',
               values_to='returns') %>%
  group_by(year, strategy) %>%
  summarise(avg_ret = sum(returns),
            ret_ci   = 1.96 * sd(returns)/sqrt(n())) %>%
  ggplot(aes(x = year, y = avg_ret, group = strategy)) +
  geom_line(aes(linetype = strategy), position = pd) +
  scale_linetype_manual(values=c(2, 1))+
  geom_hline(yintercept=0, linetype=3, 
             color = "red")+
  geom_errorbar(aes(ymin = avg_ret - ret_ci, ymax = avg_ret + ret_ci),
                width = .1, position = pd, linetype = 1) +
  geom_point(size = 1, position = pd) +
  geom_point(size = 1, position = pd, color = "white") +
  guides(linetype = guide_legend("strategy")) +
  labs(#title = paste("Mean horsepower depending on",
    #              "number of yearinders and transmission type.",
    #              "Error bars represent 95% Confidence Intervals",
    #              sep = "\n"),
    x = "Year",
    y = "Yearly returns") +
  theme(
    panel.background = element_rect(fill = "white"),
    legend.key  = element_rect(fill = "white"),
    legend.position = "top",
    axis.line.x = element_line(colour = "black", linewidth =  1),
    axis.line.y = element_line(colour = "black", linewidth = 1)
  )

slagon <- dat %>% 
  select(year, etalagon,alwayslong) %>% 
  pivot_longer(cols=c('etalagon', 'alwayslong'),
               names_to='strategy',
               values_to='returns') %>%
  group_by(year, strategy) %>%
  summarise(avg_ret = sum(returns),
            ret_ci   = 1.96 * sd(returns)/sqrt(n())) %>%
  ggplot(aes(x = year, y = avg_ret, group = strategy)) +
  geom_line(aes(linetype = strategy), position = pd) +
  scale_linetype_manual(values=c(2, 1))+
  geom_hline(yintercept=0, linetype=3, 
             color = "red")+
  geom_errorbar(aes(ymin = avg_ret - ret_ci, ymax = avg_ret + ret_ci),
                width = .1, position = pd, linetype = 1) +
  geom_point(size = 1, position = pd) +
  geom_point(size = 1, position = pd, color = "white") +
  guides(linetype = guide_legend("strategy")) +
  labs(#title = paste("Mean horsepower depending on",
    #              "number of yearinders and transmission type.",
    #              "Error bars represent 95% Confidence Intervals",
    #              sep = "\n"),
    x = "Year",
    y = "Yearly returns") +
  theme(
    panel.background = element_rect(fill = "white"),
    legend.key  = element_rect(fill = "white"),
    legend.position = "top",
    axis.line.x = element_line(colour = "black", linewidth =  1),
    axis.line.y = element_line(colour = "black", linewidth = 1)
  )

s1011 <- dat %>% 
  select(year, eta1011,alwayslong) %>% 
  pivot_longer(cols=c('eta1011', 'alwayslong'),
               names_to='strategy',
               values_to='returns') %>%
  group_by(year, strategy) %>%
  summarise(avg_ret = sum(returns),
            ret_ci   = 1.96 * sd(returns)/sqrt(n())) %>%
  ggplot(aes(x = year, y = avg_ret, group = strategy)) +
  geom_line(aes(linetype = strategy), position = pd) +
  scale_linetype_manual(values=c(2, 1))+
  geom_hline(yintercept=0, linetype=3, 
             color = "red")+
  geom_errorbar(aes(ymin = avg_ret - ret_ci, ymax = avg_ret + ret_ci),
                width = .1, position = pd, linetype = 1) +
  geom_point(size = 1, position = pd) +
  geom_point(size = 1, position = pd, color = "white") +
  guides(linetype = guide_legend("strategy")) +
  labs(#title = paste("Mean horsepower depending on",
    #              "number of yearinders and transmission type.",
    #              "Error bars represent 95% Confidence Intervals",
    #              sep = "\n"),
    x = "Year",
    y = "Yearly returns") +
  theme(
    panel.background = element_rect(fill = "white"),
    legend.key  = element_rect(fill = "white"),
    legend.position = "top",
    axis.line.x = element_line(colour = "black", linewidth =  1),
    axis.line.y = element_line(colour = "black", linewidth = 1)
  )

slagon12 <- dat %>% 
  select(year, etalagon12,alwayslong) %>% 
  pivot_longer(cols=c('etalagon12', 'alwayslong'),
               names_to='strategy',
               values_to='returns') %>%
  group_by(year, strategy) %>%
  summarise(avg_ret = sum(returns),
            ret_ci   = 1.96 * sd(returns)/sqrt(n())) %>%
  ggplot(aes(x = year, y = avg_ret, group = strategy)) +
  geom_line(aes(linetype = strategy), position = pd) +
  scale_linetype_manual(values=c(2, 1))+
  geom_hline(yintercept=0, linetype=3, 
             color = "red")+
  geom_errorbar(aes(ymin = avg_ret - ret_ci, ymax = avg_ret + ret_ci),
                width = .1, position = pd, linetype = 1) +
  geom_point(size = 1, position = pd) +
  geom_point(size = 1, position = pd, color = "white") +
  guides(linetype = guide_legend("strategy")) +
  labs(#title = paste("Mean horsepower depending on",
    #              "number of yearinders and transmission type.",
    #              "Error bars represent 95% Confidence Intervals",
    #              sep = "\n"),
    x = "Year",
    y = "Yearly returns") +
  theme(
    panel.background = element_rect(fill = "white"),
    legend.key  = element_rect(fill = "white"),
    legend.position = "top",
    axis.line.x = element_line(colour = "black", linewidth =  1),
    axis.line.y = element_line(colour = "black", linewidth = 1)
  )


buyandhold <- dat %>% 
  select(year, buyandhold,alwayslong) %>% 
  pivot_longer(cols=c('buyandhold', 'alwayslong'),
               names_to='strategy',
               values_to='returns') %>%
  group_by(year, strategy) %>%
  summarise(avg_ret = sum(returns),
            ret_ci   = 1.96 * sd(returns)/sqrt(n())) %>%
  ggplot(aes(x = year, y = avg_ret, group = strategy)) +
  geom_line(aes(linetype = strategy), position = pd) +
  scale_linetype_manual(values=c(2, 1))+
  geom_hline(yintercept=0, linetype=3, 
             color = "red")+
  geom_errorbar(aes(ymin = avg_ret - ret_ci, ymax = avg_ret + ret_ci),
                width = .1, position = pd, linetype = 1) +
  geom_point(size = 1, position = pd) +
  geom_point(size = 1, position = pd, color = "white") +
  guides(linetype = guide_legend("strategy")) +
  labs(#title = paste("Mean horsepower depending on",
    #              "number of yearinders and transmission type.",
    #              "Error bars represent 95% Confidence Intervals",
    #              sep = "\n"),
    x = "Year",
    y = "Yearly returns") +
  theme(
    panel.background = element_rect(fill = "white"),
    legend.key  = element_rect(fill = "white"),
    legend.position = "top",
    axis.line.x = element_line(colour = "black", size = 1),
    axis.line.y = element_line(colour = "black", size = 1)
  )


pdf("./images/yearly_returns_SPY.pdf", 20,15)
plot_grid(sonfh,s12,sonfh12,son,son12,slag, slag12,slagon,s1011,slagon12,buyandhold,
          ncol=4,nrow=3)
dev.off()

pdf("./images/cumRet_returns_SPY.pdf", 15,10)
cumRet
dev.off()


