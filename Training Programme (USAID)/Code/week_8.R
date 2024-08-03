####Set the working directory- getwd()/ setwd("Y:/")

getwd()
setwd("D:/R_programming/Practice file/Week 8 Session 2 Practical")

#install openxlsx package or xlsx package

library(openxlsx)
library(readxl)

########import data set from xlsx file

study_1 <- read.xlsx("Tree_height.xlsx")
study_1
attach(study_1)

study_2 <- read_excel("Tree_height.xlsx", sheet=2)
study_2

#Add plot together
#The usage of patchwork is simple: just add plots together!

library(ggplot2)
library(patchwork)
str(study_1)
p1<- ggplot(study_1,aes(x=treatment, y=biomass, fill=treatment)) + 
  geom_bar(position="dodge",stat="identity" ) 
p1

p2<-ggplot(study_1, aes(x = plant, y = biomass)) + 
  stat_boxplot(geom = "errorbar", # Error bars
               width = 0.2) + # Bars width
  geom_boxplot()
p2

p3<-ggplot(study_1, aes(x = treatment, y = biomass, fill= treatment)) + 
  stat_boxplot(geom = "errorbar", # Error bars
               width = 0.2) +    # Bars width
  geom_violin()
p3

p4<- ggplot(study_1, aes(x=year, y=biomass)) +
  geom_point() +
  geom_smooth(method=lm , color="red",lwd=1, se=FALSE) +
  theme_gray()
p4

#### Simple addition 
p1+p2

### Nested patchwork
patch <- p1+p2
p3+patch
patch - p3 

### or
wrap_plots(patch, p3)

wrap_plots(p3, patch)

### Adding text position to the right side
p1+grid::textGrob("Some really important text")

### Adding position to the left
# This won't do anything
grid::textGrob("Bar Chart")+ p1

###This will work
wrap_elements(grid::textGrob("heavy metal effect on plant"))+ p1

#Stacking and packing
#putting plots besides each other or on top of each other 
#patchwork provides 2 shortcut operators. 
# "|" will place plots next to each other 
# "/" will place them on top of each other

#plots next to each other
p1 + p2
#or
p1 | p2

#on top of each other

p1 / p2

#complex addition: nested plot and normal plot

p1 / (p2 | p3)


(p1 | p2 ) / p3

#Modifying the theme of patchwork

patchwork <- p1 / (p2 | p3)
patchwork

patchwork & theme_minimal()

#Controlling Layouts

#Adding an empty area

p1 + plot_spacer() + p2 + plot_spacer() + p3 + plot_spacer()

###controling the grid
p1+p2+p3+p4+
  plot_layout(ncol=3)

p1 + p2 + p3 + p4 + 
  plot_layout(widths = c(1, 1)) # all figure same size


p1 + p2 + p3 + p4 + 
  plot_layout(widths = c(2, 1)) # 1st column double size and 2nd column single size

##Insets

p4+inset_element(p2,left=0.6,bottom=0.6,right=1,top=1)


#Loading Files from Other Programs

#File format	            - Function	    - Library
#ERSI ArcGIS	            -read.shapefile	-shapefiles
#Matlab	                  -readMat	      -R.matlab
#minitab	                -read.mtp	      -foreign
#SAS (permanent data set)	-read.ssd	      -foreign
#SAS (XPORT format)       -read.xport	    -foreign
#SPSS	                    -read.spss	    -foreign
#Stata	                  -read.dta	      -foreign
#Systat	                  -read.systat    -foreign





#how to get data from website
#Importing Data from Web
#library(dplyr)
#URL(https://raw.githubusercontent.com/ds4stats/r-tutorials/master/intro-maps/data/StatePopulation.csv)

#go to File - Import dataset - from text (readr)...- use the URL
#or

web_data <- read.csv("https://raw.githubusercontent.com/ds4stats/r-tutorials/master/intro-maps/data/StatePopulation.csv", as.is = TRUE)
str(web_data)


#Export a DataFrame to Excel File in R

install.packages("writexl")

library("writexl")

#the DataFrame

web_data <- read.csv("https://raw.githubusercontent.com/ds4stats/r-tutorials/master/intro-maps/data/StatePopulation.csv", as.is = TRUE)
print (web_data)


#The DataFrame name is: web_data
#get the path of wd

getwd()

write_xlsx(web_data,"D:\\R_programming\\Practice file\\Code_store_file\\R\\R1\\week8.xlsx")
#or
write_xlsx(web_data, "week8_1.xlsx")


#another example

library(openxlsx)
library(readxl)
study_1 <- read.xlsx("Tree_height.xlsx")
str(study_1)

#summary statistics
install.packages("Rmisc")
library(Rmisc)

#export the sum within a data set

sum1<-aggregate(biomass~treatment+year,data=study_1,FUN=sum)
print(sum1)

write_xlsx(sum1,"D:\\R_programming\\Practice file\\Code_store_file\\R\\R1\\sum2.xlsx")
#or
write_xlsx(sum1, "sum2_1.xlsx")

#Export the mean, sd, se, ci  within a data set

mean1 <- summarySE(study_1, measurevar="biomass", groupvars=c("treatment"), na.rm=FALSE)
print(mean1)

write_xlsx(mean1, "D:\\R_programming\\Practice file\\Code_store_file\\R\\R1\\treatment.xlsx")

#or
write_xlsx(mean1, "treatment_1.xlsx")
#Export csv file
write.csv(mean1, "D:\\R_programming\\Practice file\\Code_store_file\\R\\R1\\csvfile.csv", row.names = FALSE)

#Export data with xlsx package

library(xlsx)

mean1 <- summarySE(study_1, measurevar="biomass", groupvars=c("treatment"), na.rm=FALSE)
print(mean1)

write_xlsx(mean1, "D:\\R_programming\\Practice file\\Code_store_file\\R\\R1\\excelfile.xlsx", rowNames = FALSE)           

#Import simple graph and make it better in PowerPoint
str(study_1)
library(ggplot2)

p1<- ggplot(study_1, aes(x=treatment, y=biomass,fill=treatment)) + 
  geom_bar(position="dodge", stat="identity")

p1

p2<-ggplot(study_1, aes(x = plant, y = biomass)) + 
  stat_boxplot(geom = "errorbar", # Error bars
               width = 0.2) +    # Bars width
  geom_boxplot()+
  theme_bw()
p2

