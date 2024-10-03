# Logistic Regression
setwd('D:/R_programming/Practice file/Code_store_file/NBICTLAB_RDSML_B5_serial_num_58/logistic_regression')
# Importing the dataset
training_set = read.csv('training_set.csv')

# Encoding the target feature as factor
training_set$Purchased = factor(training_set$Purchased, levels = c(0, 1))

training_set$Purchased
# Fitting Logistic Regression to the Training set
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)

summary(classifier)

# Importing the test dataset
test_set = read.csv('test_set.csv')


# Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred


# Making the Confusion Matrix
cm = table(test_set[, 3] > .5, y_pred > .5)
cm

###
new_data <- read.csv("new_data.csv")

new_pred = predict(classifier, type = 'response', newdata = new_data[-3])
new_pred

y_new = ifelse(new_pred > 0.5, 1, 0)
y_new
