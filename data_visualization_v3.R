#importing the library 

#library for datasets
library(openintro)

library(tidyverse)
#data manipulation library 
library(dplyr)
#visualization library 
library(ggplot2)


mpg <- openintro::mpg

?mpg

ggplot(data=mpg)+ #creating boxplot 
  geom_boxplot(
    aes(fl,cyl),
    fill="red",
    alpha=0.5
  )+
  geom_jitter(
    aes(fl,cyl),
    color="blue",
    alpha=0.5
    )



  