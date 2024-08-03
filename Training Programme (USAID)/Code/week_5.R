###task-04
### For single comparison
getwd()
setwd("D:/R_programming/Practice file/Week 3 Session 2 Practical")
library(openxlsx)
library(readxl)
study_1 <- read.xlsx("Tree_height.xlsx")
study_1
library(ggplot2)
p1 <- ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
  stat_boxplot(geom="errorbar",
               width=0.25)+
  geom_boxplot()+
  guides(fill=guide_legend(title="legend"))+
  labs(title="Sajib Mia",
       subtitle = "Nursery experiment",
       y="species biomass (gm)",
       x="species number",
       caption = "Task: week 4 R training course")+
  theme(plot.title=element_text(size=18,color='green'),
        plot.subtitle = element_text(size=16,color="red"),
        axis.title.x=element_text(size=14),
        axis.title.y=element_text(size=14),
        axis.text.x=element_text(size=14),
        axis.text.y=element_text(size=14),
        text=element_text(color="black",face="bold"),
        plot.background=element_rect(fill="grey"),
        plot.margin=unit(c(1,1,1,1), "cm"),
        legend.position = "right",)+
  coord_cartesian(ylim=c(0,450))+ 
  geom_signif(comparisons = list(c("p2","p4")),
            map_signif_level = TRUE,
            textsize=5)
p1

 getwd() 
 setwd("D:/R_programming/Practice file/Week 3 Session 2 Practical")
 library(openxlsx)
 library(readxl)
 study_1 <- read.xlsx("Tree_height.xlsx")
 study_1
install.packages("ggsignif")
library(ggsignif) 
## For multiple comparison
str(study_1)
p2 <- ggplot(study_1,aes(x=treatment,y=biomass,fill=treatment))+
  stat_boxplot(geom="errorbar",
               width=0.25)+
  geom_boxplot()+
  guides(fill=guide_legend(title="legend"))+
  labs(title="Sajib Mia",
       subtitle = "Nursery experiment",
       y="species biomass (gm)",
       x="species number",
       caption = "Task: week 4 R training course")+
  theme(plot.title=element_text(size=18,color='green'),
        plot.subtitle = element_text(size=16,color="red"),
        axis.title.x=element_text(size=14),
        axis.title.y=element_text(size=14),
        axis.text.x=element_text(size=14),
        axis.text.y=element_text(size=14),
        text=element_text(color="black",face="bold"),
        plot.background=element_rect(fill="grey"),
        plot.margin=unit(c(1,1,1,1), "cm"),
        legend.position = "right",)+
  coord_cartesian(ylim=c(0,500))+
  geom_signif(comparisons = list(c("Control","Drought"),c("Rain","Control")),
            map_signif_level = TRUE,margin_top = 0.1,step_increase = 0.2,
            tip_length = 0.03,
            textsize=5)
p2

###coord_flip() function for directional change of graph
p2+coord_flip()
### Barchart in ggplot
ggplot(study_1,aes(x=treatment,y=biomass,fill=treatment))+
  geom_bar(position="dodge",stat="identity")
###Group bar by the function fill
ggplot(study_1,aes(x=treatment,y=biomass,fill=plant))+
  geom_bar(position="dodge",stat="identity")
## Add a title, change color palette, axis title
##title and axis title: labs()
## color palette: scale_fill_viridis(discreate=T)
install.packages("viridisLite")
install.packages("viridis")
library(viridisLite)
library(viridis)
T1 <- ggplot(study_1,aes(x=treatment,y=biomass,fill=plant))+
  geom_bar(position="dodge",stat="identity")+
  guides(fill=guide_legend(title="Treatment"))+
  scale_fill_viridis(discrete=T)+
  labs(title="Plant responses under climate",
       subtitle="Nursery experiment",
       y="Species biomass",
       x="Treatment",
       caption = "Task:week 5 R training course")
T1
#### Use some built in theme for ggplot
install.packages("ggthemes")
install.packages("hrbrthemes")
library(ggplot2)
library(ggthemes)
library(hrbrthemes)
T1 <- ggplot(study_1,aes(x=treatment,y=biomass,fill=plant))+
  geom_bar(position="dodge",stat="identity")+
  guides(fill=guide_legend(title="plant"))+
  scale_fill_viridis(discrete=T)+
  labs(title="Plant responses under climate",
       subtitle="Nursery experiment",
       y="Species biomass",
       x="Treatment",
       caption = "Task:week 5 R training course")
T1
T1+theme_classic()
##Class task
##use the following theme to bar chart T1
T1+theme_ipsum_es()
T1+theme_ipsum()
T1+theme_bw()
T1+theme_test()
T1+theme_gray()I
T1+theme_light()
##seperate bar graph with the function facet_wrap()
T1 <- ggplot(study_1,aes(x=treatment,y=biomass,fill=plant))+
  geom_bar(position="dodge",stat="identity")+
  guides(fill=guide_legend(title="plant"))+
  scale_fill_viridis(discrete=T)+
  labs(title="Plant responses under climate",
       subtitle="Nursery experiment",
       y="Species biomass",
       x="Treatment",
       caption = "Task:week 5 R training course")+
  theme(legend.position = "none")+
  theme_gray()+
  facet_wrap(~plant)
  ###create data set and row binf in R
a <- data.frame(study_area=c("KNP","LNP","SNP"),species=c(3,2,4),frame=rep("a",3))
b <- data.frame(study_area=c("KNP","LNP","SNP"),species=c(5,3,7),frame=rep("b",3))
study_3 <-rbind(a,b)
head(study_3)
ggplot(study_3,aes(x=study_area,y=species,fill=study_area))+
  geom_bar(position="dodge",stat="identity")+
  theme_bw()
####animated barplot transition with r
##build an animated plot with gganimate 
install.packages("gganimate")
library(ggplot2)
library(gganimate)
ggplot(study_3,aes(x=study_area,y=species,fill=study_area))+
  geom_bar(position="dodge",stat="identity")+
  theme_bw()+
###gganimate specific bits
 transition_states(
   frame,
   transition_length=2,
   state_length=1)+
  ease_aes('sine_in_out')
 ####animation save
anim_save("288_animated_barplot_transition.gif")
###Normal plot
ggplot(study_1,aes(x=year,y=biomass))+
  geom_point()+
  theme_gray()
###with linear trend
ggplot(study_1,aes(x=year,y=biomass))+
  geom_point()+
  geom_smooth(method=lm,color="red",lwd=2,se=FALSE)+
  theme_gray()
###linear trend+ confidence interval 
ggplot(study_1,aes(x=year,y=biomass))+
  geom_point()+
  geom_smooth(method=lm,color="red",lwd=1,se=TRUE,fill="yellowgreen")+
  theme_gray()
###customize confidence intervaal
###90%
ggplot(study_1,aes(x=year,y=biomass))+
  geom_point()+
  geom_smooth(method=lm,color="red",lwd=2,se=TRUE,level=0.90,fill="yellowgreen")+
  theme_gray()+
  labs(title=("90% confidence intervel"))
###99%
ggplot(study_1,aes(x=year,y=biomass))+
  geom_point()+
  geom_smooth(method=lm,color="red",lwd=2,se=TRUE,level=0.99,fill="yellowgreen")+
  theme_gray()+
  labs(title=("99% confidence intervel"))
####Class task
## r and p value with geom_text()
###geom_text(x=2006,y=300,label="r=0.49;p=0.05")
ggplot(study_1,aes(x=year,y=biomass))+
  geom_point()+
  geom_smooth(method=lm,color="red",lwd=2,se=TRUE,level=0.99,fill="yellowgreen")+
  theme_gray()+
  labs(title=("99% confidence intervel"))+
  geom_text(x=2006,y=300,label="r=0.49;p=0.05")
###Scatter plot with ellipses in ggplot
##adding ellipse with stat_ellipse
head(study_1)
ggplot(study_1,aes(x=year,y=biomass))+
  geom_point()+
  stat_ellipse()
###customization color, line type and line width
##color=2,
###linetype=2,
###lwd=2
head(study_1)
ggplot(study_1,aes(x=year,y=biomass))+
  geom_point()+
  stat_ellipse(color=2,
               linetype=6,
               lwd=2)

##add 95% confidence level with ellipse
ggplot(study_1,aes(x=year,y=biomass))+
  geom_point()+
  stat_ellipse(level=0.95,color='red')
##99%
ggplot(study_1,aes(x=year,y=biomass))+
  geom_point()+
  stat_ellipse(level=0.99,color='red')
###90%
ggplot(study_1,aes(x=year,y=biomass))+
  geom_point()+
  stat_ellipse(level=0.90,color='black')
##ellipse by group
##color by treatment or study area
ggplot(study_1,aes(x=year,y=biomass,color=treatment))+
  geom_point()+
  stat_ellipse(level=0.90,color='black')
###linetpe by group in ellipse
ggplot(study_1,aes(x=year,y=biomass,color=treatment,linetype=treatment))+
  geom_point()+
  stat_ellipse(level=0.90,color='black')
###fill the area with ellipse
##geom="polygon" 
ggplot(study_1,aes(x=year,y=biomass,color=treatment,linetype=treatment))+
  geom_point()+
  stat_ellipse(geom="polygon",
               aes(fill=treatment))
####polygon by group with transparency 
##Alpha
ggplot(study_1,aes(x=year,y=biomass,color=treatment,linetype=treatment))+
  geom_point()+
  stat_ellipse(geom="polygon",
               aes(fill=treatment),
               alpha=0.1)
###how ellipse looks like with a big data set
##with a data simulation
head(study_2)
              