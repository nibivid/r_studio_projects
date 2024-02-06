library(tidyverse)
library(MASS)
library(ISLR)
library(ISLR2)
library(nnet)### get this if you don't
library(e1071) ## get this if you don't
## make a dummy for default

Default|>
  mutate(
    default_dumm = ifelse(
      default == "Yes",
      1,0
    )
  )-> def_dum

## regress dummy over balance and plot 

lm(default_dumm ~ balance, 
   data = def_dum)|>
  broom::augment()|>
  ggplot(aes(balance,default_dumm))+
  geom_point(alpha= 0.6)+
  geom_line(aes(balance, .fitted),
            colour = "red")+
  labs(
    title = "Linear regression fit to qualitative response",
    subtitle = "Yes =1, No = 0",
    y = "prob default status"
  )+
  theme_minimal() -> plot_linear

## Run the logistic regression

glm(
  default_dumm ~ balance,
  data = def_dum,
  family = binomial
)|>
  broom::augment(type.predict = "response")-> df




  ggplot(aes(balance,default_dumm))+
  geom_point(alpha= 0.6)+
  geom_line(aes(balance, .fitted),
            colour = "red")+
  labs(
    title = "Logistic regression fit to qualitative response",
    subtitle = "Yes =1, No = 0",
    y = "prob default status"
  )+
  theme_minimal() -> logistic_plot



broom
