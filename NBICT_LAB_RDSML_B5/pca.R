# PCA
setwd("D:/R_programming/Practice file/Code_store_file/NBICTLAB_RDSML_B5_serial_num_58/PCA")
# Importing the dataset
dataset = read.csv('Wine.csv')

# Feature Scaling
dataset[-14] = scale(dataset[-14])

# Applying PCA
install.packages('caret')
library(caret)
# install.packages('e1071')
library(e1071)
pca = preProcess(x = dataset[-14], method = 'pca', pcaComp = 2)
dataset_pca = predict(pca, dataset)
dataset_pca = dataset_pca[c(2, 3, 1)]

# Fitting SVM to the Training set
# install.packages('e1071')
library(e1071)
classifier = svm(formula = Customer_Segment ~ .,
                 data = dataset_pca,
                 type = 'C-classification',
                 kernel = 'linear')

# Predicting the Test set results
y_pred = predict(classifier, newdata = dataset_pca[-3])

# Making the Confusion Matrix
cm = table(dataset_pca[, 3], y_pred)
cm

# Visualising the results
library(ElemStatLearn)
set = dataset_pca
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('PC1', 'PC2')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM',
     xlab = 'PC1', ylab = 'PC2',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 2, 'deepskyblue', ifelse(y_grid == 1, 'springgreen3', 'tomato')))
points(set, pch = 21, bg = ifelse(set[, 3] == 2, 'blue3', ifelse(set[, 3] == 1, 'green4', 'red3')))

