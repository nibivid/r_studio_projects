#importing the dependency
library(MASS)
library(ISLR2)
library(broom)

head(Boston)

#fitting a linear regression function 
lm.fit = lm(medv~lstat , data=Boston)

lm.fit
coef(lm.fit)

col_names=colnames(Boston)[-length(colnames(Boston))]
input_=paste("medv ~",  paste(
  col_names,
  collapse = "+"
))

input_
#fitting multiple variables in the linear regression 
#fitting a linear regression function 
model = lm(input_ , data=Boston)

model
# Augment the original dataset with model fit information
augmented_data <- augment(model)