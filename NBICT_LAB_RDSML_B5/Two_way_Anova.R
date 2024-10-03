data()
my_data <- ToothGrowth
View(my_data)

## Convert the does as a factor 
my_data$dose <- factor(my_data$dose,
                       levels=c(0.5,1,2),
                       labels =c('0.5D','1D','2D'))
my_data

## Generate Frequency table
table(my_data$supp,my_data$dose)

## Boxplot with multiplot group
library(ggpubr)
ggboxplot(my_data,
          x="dose",
          y="len",
          color = "supp",
          pellete=c("blue","red"))

## Lime plots with multiple group
library(ggline)
ggline(my_data,
          x="dose",
          y="len",
          color = "supp",
          add=c('mean_se','dotplot'),
          pellete=c("blue","red")
       )

## Computing two way ANova test
res_aov2 <- aov(len~supp+dose,data=my_data)
summary(res_aov2)

##  Two way anova with interaction effect
res_aov3 <- aov(len~supp*dose,data=my_data)
summary(res_aov3)

## Compute some summary statistics
require("dplyr")
group_by(my_data,supp,dose)%>%
  summarise(
    count=n(),
    mean=mean(len,na.rm = T),
    sd=sd(len,na.rm=T)
    
  )

## Tukey multiple pairwise test
TukeyHSD(res_aov3)

## Homogenity of varience test
plot(res_aov3,1)
library(car)
leveneTest(len~supp*dose,data=my_data)

## normality test
plot(res_aov3,2)
## Extract the residuals
aov_rasiduls <- residuals(object=res_aov3)
shapiro.test(aov_rasiduls)
