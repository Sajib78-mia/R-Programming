#### importing dataset

setwd("D:/R_programming/Practice file/Code_store_file/NBICTLAB_RDSML_B5_serial_num_58")
getwd()
height_dia <- read.csv("trees.csv.csv")
height_dia
attach(height_dia)
View(height_dia)

cor.test(Girth,Height)

### install.pcakages ggstatsplot

install.packages("ggstatsplot")
library(ggstatsplot)
ggscatterstats(
  data= height_dia,
  x= Girth,
  y= Height,
  type = "parametric"
)
