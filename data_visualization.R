library(openintro)
library(tidyverse)
library(dplyr)
library(tidyverse)
library(openintro)

#importing the dataset 
mpg <- openintro:: mpg


mpg

#making the bar plot for the mean displacment 
mpg %>% group_by(class) %>% summarise("mean_displacement"=mean(displ)) %>% ggplot() + geom_col(aes(class,mean_displacement))
