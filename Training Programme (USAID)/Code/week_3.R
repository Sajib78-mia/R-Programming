setwd("D:/R_programming/Practice file/Week 3 Session 2 Practical")
getwd()
library(openxlsx)
library(readxl)
study_1 <- read.xlsx("Tree_height.xlsx")
study_1
str(study_1)
study_2 <- read_excel("Tree_height.xlsx",sheet="study_2")
study_2
str(study_2)
unique(study_1$year)
range(study_1$year)
sort(study_1$year)
study_1[,5]
study_1[5,]
summary(study_1)
###subset
unique(study_1$year)
A <- subset(study_1,study_1$year>2007)
unique(A$year)
sort(A$year)
setwd("D:/R_programming/Practice file/Code_store_file/R/R1")
getwd()
A2 <- subset(study_1,study_1$year>2005 & study_1$year<2009 )
unique(A2$year)
### selecting a treatment
B <- subset(study_1, study_1$treatment=="Control")
unique(B$treatment)
##Deleting a treatment
D<- subset(study_1,study_1$treatment!="Control")
unique(D$treatment)
E <- subset(study_1, study_1$treatment!="Control" & study_1$treatment!="Drought")
E
unique(E$treatment)
str(E)
sort(E$treatment)
####create a scatter plot 
install.packages("plotrix")
library(plotrix)
study_2 <- read_excel("Tree_height.xlsx",sheet="study_2")
study_2
## Creating scatter plot in trend line(lm)
par(mfrow=c(1,1))
plot(study_2$Elevation_m,study_2$Diameter_cm,pch=9,col="blue")
abline(lm((Diameter_cm)~(Elevation_m),data=study_2))
  
plot(study_2$Height_m,study_2$Diameter_cm,pch=16,col="red")
abline(lm((Height_m)~(Diameter_cm),data=study_2))
## check the available symbol and figures for R
?pch
?colors
demo("colors")
Return
Return
Return
return
Return
Return
Return
Return
Return
Return
####
par(mfrow=c(1,2))
plot(study_2$Elevation_m,study_2$Diameter_cm,pch=9,col="blue")
abline(lm((Diameter_cm)~(Elevation_m),data=study_2))

plot(study_2$Height_m,study_2$Diameter_cm,pch=16,col="red")
abline(lm((Height_m)~(Diameter_cm),data=study_2))
### Create bar plot
install.packages("sciplot")
library(sciplot)
par(mfrow=c(1,1))
bargraph.CI(x.factor=study_area,response=species_richness,ylim=c(0,80),ylab="No of species",xlab="study_area",las=1,data=study_2,col=c("red","green","blue"),main="p=0.05")
##create bar plot by group
str(study_1)
bargraph.CI(x.factor=treatment,group=plant,response=biomass,ylim=c(0,250),ylab="biomass",xlab="treatment",las=1,data=study_1,legend=T,col=c("red","black"),main="p=0.05")
##line plot
str(study_1)
lineplot.CI((year), biomass, ylim=c(50,300),ylab="biomass",xlab="year",x.cont=T,legend=T,data=study_1)
## line plot by using group
lineplot.CI((year), biomass,group=treatment, ylim=c(50,300),ylab="biomass",xlab="year",x.cont=T,legend=T,data=study_1)


