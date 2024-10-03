# Taking two numeric Vectorin same length 
x= c(15,18,21,15,21)
y=c(25,25,27,27,27)

## Calculating correlation coefficent using cor method

result_1 = cor(x,y,method="spearman")

## print the result

cat("spearman correlation coefficent is:", result_1)

## Calculating correlation coefficient using cor.test()method

result_2 = cor.test(x,y,method="spearman")
## print the result_2

print(result_2)

##Example with dataset

setwd("D:/R_programming/Practice file/Code_store_file/NBICTLAB_RDSML_B5_serial_num_58")
Dataset <- read.csv("Auto.csv")
Dataset
View(Dataset)
attach(Dataset)

##3Running the test 

cor.test(mpg, weight, method="spearman")

# Data visualization
plot(mpg, weight,main="Scatter Plot",xlab = "MPG",
     ylab="WEIGHT",pch=19)
abline(lm(weight~mpg),col="blue")
