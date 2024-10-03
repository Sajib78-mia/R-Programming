# Multiple Linear Regression

# install.packages("tidyverse")

library(tidyverse)

# Loading the dataset

data("marketing", package = "datarium")
head(marketing, 4)

# Building the model

# We want to build a model for estimating sales based on the advertising 
# budget invested in youtube, facebook and newspaper, as follow:
  
# sales = b0 + b1*youtube + b2*facebook + b3*newspaper

model <- lm(sales ~ youtube + facebook + newspaper, data = marketing)
summary(model)

