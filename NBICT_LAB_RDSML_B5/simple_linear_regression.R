# Simple Linear Regression
setwd("D:/R_programming/Practice file/Code_store_file/NBICTLAB_RDSML_B5_serial_num_58/Simple_Linear_Regression")
# Importing the dataset
dataset = read.csv('Salary_Data.csv')
View(dataset)
# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = dataset)

summary(regressor)

y_pred = predict(regressor, newdata = dataset)

# Visualizing the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$YearsExperience, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$YearsExperience, y_pred),
            colour = 'blue') +
  ggtitle('Salary vs Experience') +
  xlab('Years of experience') +
  ylab('Salary')
