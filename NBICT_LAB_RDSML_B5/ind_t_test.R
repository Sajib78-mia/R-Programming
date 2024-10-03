###independent sample t test
getwd()
setwd("D:/R_programming/Practice file/Code_store_file/NBICTLAB_RDSML_B5_serial_num_58/independent_sample_t_test")
Dataset <- read.csv("engagement.csv")
Dataset

View(Dataset)
attach(Dataset)

#Assumption test
## Normality test

shapiro.test(Male)

shapiro.test(Female)

###Checling for outliers

boxplot(Male)
boxplot(Female)

### Homogenetiy of varience test

var.test(Female, Female)

### Running the t test
t.test(Male, Female, var.equal = T)

### Descriptive analysis

summary(Dataset)
sd(Male)
sd(Female)

mean_difference= mean(Male)-mean(Female)
mean_difference
