a <- c(10,13,14,10,12,17)
b <- c(15,17,19,13,13,19)

plot(a,b)
### Package installation 

install.packages("nycflights13")
library(nycflights13)
nycflights13::flights
attach(nycflights13::flights)

plot(arr_delay, dep_delay,
     main = "Arrival vs Departure Delay")
plot(arr_delay, dep_delay,
     main = "Arrival vs Departure Delay",
     xlab = "Arrival Delay",
     ylab = "Depature Delay",
     pch = 7)
### pch ( 1= circle, 2= triangle, 3 = plus, 4 = cross
### 5 = diamond, 6 = reverse triangle, 7 = box and crossed ))