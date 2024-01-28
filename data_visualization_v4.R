#importing the library 

#library for datasets
library(openintro)

library(tidyverse)
#data manipulation library 
library(dplyr)
#visualization library 
library(ggplot2)


YRBSS <- openintro:: yrbss_samp

colnames(YRBSS)
YRBSS_group_1= YRBSS %>% group_by(gender) %>% 
  summarise(mean_traning= mean(strength_training_7d))

YRBSS_group_1

ggplot(YRBSS_group_1)+geom_col(aes(gender,mean_traning))

ggplot(YRBSS)+geom_jitter(aes(height,weight))

YRBSS

mean_height=YRBSS %>% group_by(gender) %>% 
  summarise(mean_height= mean(height))

ggplot(mean_height)+geom_col(aes(gender,mean_height))


mean_7d= YRBSS%>% group_by(gender) %>%
  summarise(mean_weekdays= mean(physically_active_7d))

ggplot(mean_7d)+geom_col(aes(gender,mean_weekdays))

hispanic=filter(YRBSS,gender
       =="male") %>% group_by(hispanic) %>% summarise(mean_height_heis=mean(height))

hispanic

ggplot(hispanic)+geom_col(aes(hispanic,mean_height_heis))





