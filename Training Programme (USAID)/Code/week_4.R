 getwd()
 setwd("D:/R_programming/Practice file/Week 3 Session 2 Practical")
 library(openxlsx)
 library(readxl)
 study_1 <- read.xlsx("Tree_height.xlsx")
 study_1
 study_2 <- read_excel("Tree_height.xlsx",sheet="study_2")
 study_2
 library(plotrix)
 par(mfrow=c(1,1))
 plot(study_2$Height_m, study_2$Diameter_cm,pch=16,col="red",cex=1,plot_bg(col="green"),xlab="Height(m)",ylab="Diameter(cm)",main="my own plot")
 ?pch
 ###Boxplot with errorbar in ggplot
 library(ggplot2)
 ggplot(study_1,aes(x=plant,y=biomass))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
                  geom_boxplot()
 ### Horizontal boxplot with errorbar in ggplot
 library(ggplot2)
 ggplot(study_1,aes(x=biomass,y=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()
 ##### Color customization in ggplot
 #### with the argument fill
 library(ggplot2)
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()
 ### Change the legend title\
 ## You can change the default title in the legend
 ### with guide function as follows
 library(ggplot2)
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()+
   guides(fill=guide_legend(title="Title"))
 ### Add title, subtitle, axis level, caption 
 ### labs function
 library(ggplot2)
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()+
   guides(fill=guide_legend(title="Title"))+
 labs(title='plant biomass',
      subtitle="Experimental plan",
      y="biomass(gm)",
      x="plant number",
      caption = "source:R training course")
 ### or with ggtitle
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()+
   guides(fill=guide_legend(title="Title"))+
   ggtitle("plant biomass@",
           subtitle="plant number") 
 #### change title, x and y labels and text size
 #### with theme function
 ###plot.title: controls plot title
### axis.title.x:control x axis title
 ### axis.title.y:control y axis title
 ###axis.text.x:control x axis text
 ###axis.text.y:control y axis text
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()+
   guides(fill=guide_legend(title="Title"))+
   labs(title='plant biomass',
        subtitle="Experimental plan",
        y="biomass(gm)",
        x="plant number",
        caption = "source:R training course")+
   theme(plot.title=element_text(size=20),
         plot.subtitle=element_text(size=16),
         axis.title.x = element_text(size=15),
         axis.title.y = element_text(size=15),
         axis.text.x = element_text(size=15),
         axis.text.y = element_text(size=15))
 
 ###CHANE COLOR OF ALL FUNCTION
 ## WITH THEME FUNCTION
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()+
   guides(fill=guide_legend(title="Title"))+
   labs(title='plant biomass',
        subtitle="Experimental plan",
        y="biomass(gm)",
        x="plant number",
        caption = "source:R training course")+
   theme(plot.title=element_text(size=20,colour = "red"),
         plot.subtitle=element_text(size=16,colour = "blue"),
         axis.title.x = element_text(size=15),
         axis.title.y = element_text(size=15),
         axis.text.x = element_text(size=15),
         axis.text.y = element_text(size=15))
 
  ###change all text color in a plot
 ### with theme function
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()+
   guides(fill=guide_legend(title="Title"))+
   labs(title='plant biomass',
        subtitle="Experimental plan",
        y="biomass(gm)",
        x="plant number",
        caption = "source:R training course")+
   theme(plot.title=element_text(size=20),
         plot.subtitle=element_text(size=16),
         axis.title.x = element_text(size=15),
         axis.title.y = element_text(size=15),
         axis.text.x = element_text(size=15),
         axis.text.y = element_text(size=15),
         text=element_text(colour = "blue"))
###change title face
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()+
   guides(fill=guide_legend(title="Title"))+
   labs(title='plant biomass',
        subtitle="Experimental plan",
        y="biomass(gm)",
        x="plant number",
        caption = "source:R training course")+
   theme(plot.title=element_text(size=20),
         plot.subtitle=element_text(size=16,face="bold",colour = "black"),
         axis.title.x = element_text(size=15,face="bold"),
         axis.title.y = element_text(size=15,face="bold"),
         axis.text.x = element_text(size=15,face="bold"),
         axis.text.y = element_text(size=15,face="bold"),
         text=element_text(colour = "blue"))
 ###adjust x and y limit
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()+
   guides(fill=guide_legend(title="Title"))+
   labs(title='plant biomass',
        subtitle="Experimental plan",
        y="biomass(gm)",
        x="plant number",
        caption = "source:R training course")+
   theme(plot.title=element_text(size=20),
         plot.subtitle=element_text(size=16,face="bold",colour = "black"),
         axis.title.x = element_text(size=15,face="bold"),
         axis.title.y = element_text(size=15,face="bold"),
         axis.text.x = element_text(size=15,face="bold"),
         axis.text.y = element_text(size=15,face="bold"),
         text=element_text(colour = "blue"))+
   coord_cartesian(ylim=c(0,500))
 
###change background and margin  
 ###plot.margin=unit(c(top,right,bottom,left),"cm")
 ###plot.background = element_rect(fill = "col")
 
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()+
   guides(fill=guide_legend(title="Title"))+
   labs(title='plant biomass',
        subtitle="Experimental plan",
        y="biomass(gm)",
        x="plant number",
        caption = "source:R training course")+
   theme(plot.title=element_text(size=20),
         plot.subtitle=element_text(size=16,face="bold",colour = "black"),
         axis.title.x = element_text(size=15,face="bold"),
         axis.title.y = element_text(size=15,face="bold"),
         axis.text.x = element_text(size=15,face="bold"),
         axis.text.y = element_text(size=15,face="bold"),
         text=element_text(colour = "blue"),
         plot.background = element_rect(fill = "yellowgreen"),
         plot.margin = unit(c(1,1,1,1),"cm"))+   
   coord_cartesian(ylim=c(0,500))
 #### hide legend position
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()+
   guides(fill=guide_legend(title="Title"))+
   labs(title='plant biomass',
        subtitle="Experimental plan",
        y="biomass(gm)",
        x="plant number",
        caption = "source:R training course")+
   theme(plot.title=element_text(size=20),
         plot.subtitle=element_text(size=16,face="bold",colour = "black"),
         axis.title.x = element_text(size=15,face="bold"),
         axis.title.y = element_text(size=15,face="bold"),
         axis.text.x = element_text(size=15,face="bold"),
         axis.text.y = element_text(size=15,face="bold"),
         text=element_text(colour = "blue"),
         plot.background = element_rect(fill = "yellowgreen"),
         plot.margin = unit(c(1,1,1,1),"cm"),
         legend.position = "none")+   
   coord_cartesian(ylim=c(0,400))
 ###change legend position
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()+
   guides(fill=guide_legend(title="legend"))+
   labs(title='plant biomass',
        subtitle="Experimental plan",
        y="biomass(gm)",
        x="plant number",
        caption = "source:R training course")+
   theme(plot.title=element_text(size=20),
         plot.subtitle=element_text(size=16,face="bold",colour = "black"),
         axis.title.x = element_text(size=15,face="bold"),
         axis.title.y = element_text(size=15,face="bold"),
         axis.text.x = element_text(size=15,face="bold"),
         axis.text.y = element_text(size=15,face="bold"),
         text=element_text(colour = "blue"),
         plot.background = element_rect(fill = "yellowgreen"),
         plot.margin = unit(c(1,1,1,1),"cm"),
         legend.position = "right")+   
   coord_cartesian(ylim=c(0,400))
 ### change legend text
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()+
   guides(fill=guide_legend(title="legend"))+
   labs(title='plant biomass',
        subtitle="Experimental plan",
        y="biomass(gm)",
        x="plant number",
        caption = "source:R training course")+
   theme(plot.title=element_text(size=20),
         plot.subtitle=element_text(size=16,face="bold",colour = "black"),
         axis.title.x = element_text(size=15,face="bold"),
         axis.title.y = element_text(size=15,face="bold"),
         axis.text.x = element_text(size=15,face="bold"),
         axis.text.y = element_text(size=15,face="bold"),
         text=element_text(colour = "blue"),
         plot.background = element_rect(fill = "yellowgreen"),
         plot.margin = unit(c(1,1,1,1),"cm"),
         legend.position = "right",
         legend.text =element_text(size=8))+   
   coord_cartesian(ylim=c(0,400))
 #### Violin boxplot 
 ### geom_violin.plot()+
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
   stat_boxplot(geom="errorbar",
                width=0.25)+
   geom_boxplot()+
   guides(fill=guide_legend(title="legend"))+
   labs(title='plant biomass',
        subtitle="Experimental plan",
        y="biomass(gm)",
        x="plant number",
        caption = "source:R training course")+
   theme(plot.title=element_text(size=20),
         plot.subtitle=element_text(size=16,face="bold",colour = "black"),
         axis.title.x = element_text(size=15,face="bold"),
         axis.title.y = element_text(size=15,face="bold"),
         axis.text.x = element_text(size=15,face="bold"),
         axis.text.y = element_text(size=15,face="bold"),
         text=element_text(colour = "blue"),
         plot.background = element_rect(fill = "yellowgreen"),
         plot.margin = unit(c(1,1,1,1),"cm"),
         legend.position = "right",
         legend.text =element_text(size=8))+   
   coord_cartesian(ylim=c(0,400))
 ####Task week 4
 ##use the study_1 data set to create the following box plot
 library(ggplot2)
 ggplot(study_1,aes(x=plant,y=biomass,fill=plant))+
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
   coord_cartesian(ylim=c(0,350))
   


   
   
 
 file.create("D:/R_programming/Practice file/Code_store_file/R")
 dir.create("D:/R_programming/Practice file/Code_store_file/R/4")