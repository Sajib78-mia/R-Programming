setwd("D:/R_programming/Practice file/Code_store_file/NBICTLAB_RDSML_B5_serial_num_58")
getwd()
height_dia <- read.csv("day_10.csv")
height_dia

View(height_dia)

cor.test(height_dia$Girth,height_dia$Height)

