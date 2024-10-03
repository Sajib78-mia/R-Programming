setwd("D:/R_programming/Practice file/Code_store_file/NBICTLAB_RDSML_B5_serial_num_58/Day_19")
data <- read.csv("Wilcoxon.csv")
data 

## Testing for normality 
shapiro.test(data$August)

shapiro.test(data$November)

## Wilcoxon sign ranked test
wilcox.test(data$August,data$November,paired=TRUE)
wilcox.test(data$November,data$August,paired=TRUE)

## Calculating of Median
median(data$August)
median(data$November)
