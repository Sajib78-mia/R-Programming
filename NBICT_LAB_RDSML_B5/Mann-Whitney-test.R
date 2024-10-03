setwd("D:/R_programming/Practice file/Code_store_file/NBICTLAB_RDSML_B5_serial_num_58/Day_19")

## Mann-Whitney test

dataset_1 <- read.csv("Mann-Whitney.csv")
dataset_1

## Testing for normaity 

shapiro.test(dataset_1$Male)

shapiro.test(dataset_1$Female)

## Running the Mann-Whitney U test
wilcox.test(dataset_1$Male,dataset_1$Female,paired = FALSE)
wilcox.test(dataset_1$Female,dataset_1$Male,paired = FALSE)

## Calculating of Median
median(dataset_1$Male)
median(dataset_1$Female)
