# One-way ANOVA in R

# Importing the dataset
dataset <- read.csv("stress.csv")

# Checking the data types of the variables
class(dataset$group)
class(dataset$coping_stress)

# Converting the grouping variable to a factor
dataset$group <- as.factor(dataset$group)

# Checking the data types of the variables again
class(dataset$group)
class(dataset$coping_stress)

# Show the levels
levels(dataset$group)

# If the levels are not automatically in the correct order, re-order them as follow:
dataset$group <- ordered(dataset$group, levels = c("Sedentary", "Low", "Moderate", "High"))

# Show the levels again
levels(dataset$group)

# Compute summary statistics by groups - count, mean, sd:
library(dplyr)
group_by(dataset, group) %>%
  summarise(
    count = n(),
    mean = mean(coping_stress, na.rm = TRUE),
    sd = sd(coping_stress, na.rm = TRUE)
  )

# Visualize your data

install.packages("ggpubr")

library(ggpubr)

ggboxplot(dataset, x = "group", y = "coping_stress", 
          color = "group", palette = c("#00AFBB", "#E7B800", "#FC4E07", "#0000FF"),
          order = c("Sedentary", "Low", "Moderate", "High"),
          ylab = "Stress", xlab = "Group")

ggline(dataset, x = "group", y = "coping_stress", 
       add = c("mean_se", "jitter"), 
       order = c("Sedentary", "Low", "Moderate", "High"),
       ylab = "Stress", xlab = "Group")

# Compute One-way ANOVA test

res.aov <- aov(coping_stress ~ group, data = dataset)
summary(res.aov)

# Tukey multiple pairwise-comparisons

TukeyHSD(res.aov)

# Check the homogeneity of variance assumption

plot(res.aov, 1)
library(car)
leveneTest(coping_stress ~ group, data = dataset)

# Check the normality assumption

plot(res.aov, 2)
# Extract the residuals
aov_residuals <- residuals(object = res.aov )
# Run Shapiro-Wilk test
shapiro.test(x = aov_residuals )

