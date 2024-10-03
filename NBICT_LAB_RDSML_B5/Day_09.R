install.packages("nycflights13")
library(nycflights13)
nycflights13::flights
attach(nycflights13::flights)
plot(arr_delay, dep_delay)

###pairs plot
pairs(~arr_delay + dep_delay)
pairs(~ distance + arr_delay + dep_delay + air_time)

### Time series plot
data()
weather

### Histogram 
par(mfrow=c(1,2))
hist(distance[carrier=="AA"],breaks = 10, main="AA")
hist(distance[carrier=="UA"],breaks = 10, main="UA")
###boxplot
par(mfrow=c(1,1))
boxplot(distance[carrier=="AA"],main="AA")
par(mfrow=c(1,2))
boxplot(distance[carrier=="AA"],main="AA")
boxplot(distance[carrier=="UA"],main="UA")
