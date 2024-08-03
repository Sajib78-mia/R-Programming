setwd("D:/R_programming/Practice file/Week 3 Session 2 Practical")
getwd()
library(openxlsx)

study_1 <- read.xlsx("Tree_height.xlsx")
study_1
str(study_1)
####summary statistics 
install.packages("Rmisc")
library(Rmisc)
###calculate the sum within a data set
sum1 <- aggregate(biomass~treatment+year+plant,data=study_1,FUN=sum)
sum1
str(sum1)
## calculate the mean, sd, se and ci in a dataset
mean1 <- summarySE(study_1,measurevar = "biomass", groupvars = c("treatment","year","plant"),na.rm=FALSE)
mean1
mean1 <- summarySE(study_1,measurevar = "biomass", groupvars = c("treatment","year"),na.rm=FALSE)
mean1
str(mean1)
#### shapiro tes
###shapiro wilk normality test
## why is it used
## To test id a sample follows normal distribution
###normally distributed= if p>0.05
#### not normally distributed= if p<0.05
str(study_1)
shapiro.test(study_1$biomass)

#### kolmogorov and smirnov test
### is used to check wheater two sample follows the same distribution
#### from different distribution if p<0.05
## both from normal distribution if p>0.05
str(study_1)
ks.test(study_1$year,study_1$biomass)
###chi-square test
### used to test if two categorical variables are dependent 
###if p <0.05 x and is dependent 
### if p>0.05 x and y is independent 
str(study_1)
chisq.test(table(study_1$year,study_1$biomass),correct=FALSE)
summary(table(study_1$year,study_1$biomass))
####simple correlation
library(readxl)
study_2 <- read_excel("Tree_height.xlsx",sheet="study_2")
study_2
str(study_2)
cor(study_2$Elevation_m,study_2$Diameter_cm)
cor.test(study_2$Elevation_m,study_2$Diameter_cm)

####Build loinear model
ml=lm(Diameter_cm~Elevation_m,data=study_2)
ml
##t-statistics,R-square,F-statistics, p-value
## large t score or t value indicates that the group are different
### while small t score indicates that group are similar 
#### R-square=range 0-1, higher the better
### F-statistic higher the better
### p value p<0.05, significant variation   

summary(ml)

#### How to know if the model is best fit for the data
AIC(ml)
BIC(ml)
# R square higher the better (> 0.70)
# adjust R square higher the better
# F statistics higher the better
# Standard error- close to zero the better
# t value should be greater 1.96 for the p value to be less than 0.05
# AIC - lower the better
# BIC - lower the better

### ANOVA
### linear model
### testing biomass vs year

par(mfrow=c(1,2))
C=lm((biomass)~year, data = study_1)
C=lm(log(biomass)~year, data = study_1)
C=lm((biomass)^2~year, data = study_1)
plot(fitted(C), resid(C), xlab = "fitted", ylab = "residuals")
qqnorm(resid(C), main= "Biomass")
qqline(resid(C), main= "Biomass", col= 2)
anova(C)

### posthoc test

TukeyHSD(aov((biomass)~ as.factor(year), data = study_1))

### ### ANOVA
### linear model
### testing biomass vs traetment

par(mfrow=c(1,2))
C=lm((biomass)~treatment, data = study_1)
plot(fitted(C), resid(C), xlab = "fitted", ylab = "residuals")
qqnorm(resid(C), main= "Treatments")
qqline(resid(C), main= "Treatments", col= 2)
anova(C)

### ### ANOVA
### linear model
### testing biomass vs plant

par(mfrow=c(1,2))
C=lm((biomass)~plant, data = study_1)
plot(fitted(C), resid(C), xlab = "fitted", ylab = "residuals")
qqnorm(resid(C), main= "plant")
qqline(resid(C), main= "plant", col= 2)
anova(C)

### Mixed effect model

library(nlme)
par(mfrow = c(1,2))
C1=lme((biomass)~treatment*year*plant, random = ~1|repetition, data = study_1)
plot(fitted(C1), resid(C1), xlab = "fitted", ylab = "residuals")
qqnorm(resid(C1), main= "mixed")
qqline(resid(C1), main= "mixed", col= 2)
anova(C1)

### posthoc test

TukeyHSD(aov((biomass)~ as.factor(year), random = ~1|repetition, data = study_1))
TukeyHSD(aov((biomass)~ treatment*as.factor(year), random = ~1|repetition, data = study_1))
TukeyHSD(aov((biomass)~ treatment*as.factor(year)*plant, random = ~1|repetition, data = study_1))
