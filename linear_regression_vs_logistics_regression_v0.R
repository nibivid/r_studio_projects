library(tidyverse)
library(MASS)
library(ISLR)
library(ISLR2)
library(nnet)### get this if you don't
library(e1071) ## get this if you don't

#checking the a customer will go bankrupt or not 
default_df=Default 

# Encode the 'default' variable as binary: 'Yes' as 1 and 'No' as 0
# Using dplyr's mutate function to create a new column 'default_enco' in 'default_df' dataframe
# ifelse() function is used to conditionally assign 1 if 'default' is "Yes" and 0 otherwise
# Store the modified dataframe as 'default_df_encoded'

default_df |> mutate(
  "default_enco"=ifelse(
    default=="Yes",
    1,0
  )  
) -> default_df_encoded

# Build a linear regression model
# Predicting 'default_enco' based on 'balance' using lm() function
# Store the model as 'prediction'
lm(
  default_enco ~ balance,
  data=default_df_encoded
) -> prediction

# Visualize the model using ggplot2
# Plot the observed values and the fitted values against 'balance'
ggplot(data=broom::augment(prediction))+ 
  geom_point(aes(balance,default_enco),alpha=0.5)+
  geom_line(aes(x=balance,y=.fitted))


#solving the same problem withe logistic regression 
glm(default_enco ~ balance,
    data=default_df_encoded,
    family=binomial) |> 
  broom::augment(type.predict = "response") ->prediction_log

prediction_log

ggplot(data=prediction_log)+
  geom_point(aes(x=balance,y=default_enco))+
  geom_line(aes(x=balance,y=.fitted),alpha=.5)


filter(prediction_log, balance > 5000) ->balance_greater_5000
balance_greater_5000

# Solving the same problem with logistic regression 
subset_prediction_log <- prediction_log[prediction_log$balance > 5000, ]

subset_prediction_log
