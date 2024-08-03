setwd("D:/R_programming/Practice file/Week 6 Session 2 Practical")
getwd
library(openxlsx)
library(readxl)
study_1 <- read.xlsx("Tree_height.xlsx")
study_1
study_2 <- read.xlsx("Tree_height_2.xlsx")
str(study_2)
study_3 <- read.csv("D:/R_programming/Practice file/Week 6 Session 2 Practical/tree_height_3.csv")
str(study_3)
###
library(ggplot2)

t2<- ggplot(study_2,aes(x=Study_area,y=Species_richness,fill=Study_area))+
  geom_bar(position="dodge",stat="identity")+
  guides(fill=guide_legend(title="Study Area"))+
  labs(title="sajib Mia",
       subtitle = "Bar plot",
       y="Species Richness",
       x="Study Area",
       caption="Task:week 5 training course")
t2
###add the following theme to a bar graph
library(ggthemes)
library(hrbrthemes)
t2+theme_excel()
t2+theme_excel_new()
t2+theme_few()
t2+theme_foundation()
t2+theme_clean()
t2+theme_igray()
###Correlation text size
install.packages("corplot")
library(corrplot)
library(psych)
corPlot(study_2[, 3:6],
       cex=1.25) 
corPlot(study_2[, 3:6],
       stars=TRUE, cex=1.25) 
corPlot(study_2[, 3:6],
        pval=TRUE, cex=1.25) 
###remove diagonal
corPlot(study_2[, 3:6],
        stars=TRUE, cex=1.25,diag = FALSE)
###most basis bubble chart with geom_point()
library(ggplot2)
library(dplyr)
ggplot(study_2,aes(x=Elevation_m,y=Species_richness,size=Height_m))+
  geom_point(alpha=0.8)
ggplot(study_2,aes(x=Elevation_m,y=Species_richness,size=Diameter_cm))+
  geom_point(alpha=0.5)
####control circle size with scale_size()
ggplot(study_2,aes(x=Elevation_m,y=Species_richness,size=Height_m))+
  geom_point(alpha=0.8)+
  scale_size(range=c(.1,10),name="Height_m")

ggplot(study_2,aes(x=Elevation_m,y=Species_richness,size=Diameter_cm))+
  geom_point(alpha=0.8)+
  scale_size(range=c(1,10),name="Diameter_cm")
####add four dimension with color

ggplot(study_2,aes(x=Elevation_m,y=Species_richness,size=Diameter_cm,color=Height_m))+
  geom_point(alpha=0.8)+
  scale_size(range=c(1,10),name="Diameter_cm")
###change color palette, add theme  and axis title
###use of theme_clean()of the ggthemes package
##use of viridis for nice color palette
###Custom axis tile with x lab and y lab
library(ggplot2)
library(dplyr)
library(viridis)
library(viridisLite)
library(ggthemes)
ggplot(study_2,aes(x=Elevation_m,y=Species_richness,size=Diameter_cm,color=Height_m))+
  geom_point(alpha=0.8)+
  scale_size(range=c(1,10),name="Diameter_cm")+
  scale_fill_viridis(discrete =TRUE,guide="none",option="A")+
  theme_clean()+
  theme(legend.position = "left")+
  ylab("species number")+
  xlab("Elevation (M)")
###Use theme_few
ggplot(study_2,aes(x=Elevation_m,y=Species_richness,size=Diameter_cm,color=Height_m))+
  geom_point(alpha=0.8)+
  scale_size(range=c(1,10),name="Diameter_cm")+
  scale_fill_viridis(discrete =TRUE,guide="none",option="A")+
  theme_few()+
  theme(legend.position = "left")+
  ylab("species number")+
  xlab("Elevation (M)")
###2D Histogram with geom_bin2D()
str(study_2)
###basic scatterplot
ggplot(study_2,aes(x=Elevation_m,y=Height_m))+
  geom_point()
##2nd Histogram with default option
ggplot(study_2,aes(x=Elevation_m,y=Height_m))+
  geom_bin2d()+
  theme_bw()
##Bin size control+ color pallete
ggplot(study_2,aes(x=Elevation_m,y=Height_m))+
  geom_bin2d(bins=50)+
  scale_fill_continuous(type="viridis") 
  theme_bw()
###you can density plot instead of histogram
  ggplot(study_2,aes(x=Elevation_m,y=Height_m))+
    geom_density_2d()
##Show the area only
  ggplot(study_2,aes(x=Elevation_m,y=Height_m))+
    stat_density_2d(aes(fill=..level..),geom="polygon",color="white")
###densitty plot
ggplot(study_2,aes(Species_richness))+
  geom_density(aes(fill=factor(Diameter_cm)),alpha=0.8)+
  labs(title="Density plot",
       subtitle ="speciess richness grouped by diameter",
       caption="source:week 6 R training course",
       x="species richness",
       y="density",
       fill="Diameter (cm)")+
  theme_classic()
###sumerize the data  with function summery
###with a data set with NA's, use na.rm=TRUE
install.packages("Rmisc")
library(Rmisc)
str(study_1)
study_4<-summarySE(study_1,measurevar = "biomass",groupvars = c("treatment","year"),na.rm=FALSE)
study_4
###Conected scatterplot
###standard error with the mean
library(ggplot2)
ggplot(study_4,aes(x=year,y=biomass,colour=treatment))+
  geom_errorbar(aes(ymin=biomass-se,ymax=biomass+se),width=.1)+
                  geom_line()+
                  geom_point()+
                  theme_grey()
 ####create_BD map
setwd("D:/R_programming/Practice file/Week 6 Session 2 Practical/BD_map")
install.packages("sf")
library(sf)
install.packages("gridExtra")
library(gridExtra)
library(ggplot2)
bd_data0<-read.sf("BGD_adm0.shp")
bd_data1<-read.sf("BGD_adm1.shp")
bd_data2<-read.sf("BGD_adm2.shp")
theme_set(theme_minimal())
map0<-ggplot(bd_data0)+
  geom_sf(fill="grey",alpha=.9)+
  labs(title="Solid map",x="Longitude",y="Lattitude")
map0
map1<-ggplot(bd_data1)+
  geom_sf(aes(fill=NAME_1))+
  labs(title="DIVISIONAL FRAGMENTS",x="Longitude",y="Lattitude")+
  theme(legend.position = "none")
map1
map2<-ggplot(bd_data2)+
  geom_sf(aes(fill=NAME_1))+
  labs(title="FRAGMENTS OF DISTRICT",
       x="Longitude",y="Lattitude")+
  theme(legend.position = "none")
map2
grid.arrange(map0,map1,map2,row=1)