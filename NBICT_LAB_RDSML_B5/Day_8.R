a <- c(10,13,14,10,12,17)
b <- c(15,17,19,13,13,19)

plot(a,b)
### Package installation 

###install.packages("nycflights13")
library(nycflights13)
nycflights13::flights
attach(nycflights13::flights)

plot(arr_delay, dep_delay,
     main = "Arrival vs Departure Delay")
plot(arr_delay, dep_delay,
     main = "Arrival vs Departure Delay",
     xlab = "Arrival Delay",
     ylab = "Depature Delay",
     pch = 1)
### pch ( 1= circle, 2= triangle, 3 = plus, 4 = cross
### 5 = diamond, 6 = reverse triangle, 7 = box and crossed ))
#### Filtering Data ( Day_7)
plot(arr_delay[carrier=="UA"], 
     dep_delay[carrier=="UA"], col = "red")

points(arr_delay[carrier=="AA"], 
       dep_delay[carrier=="AA"],
       pch = 3)

####partition multi_frame row
#### Also Equal scale for x and y axis

par(mfrow = c(1,2))

plot(arr_delay[carrier=="UA"], 
     dep_delay[carrier=="UA"],
     xlim = c(0,1000), ylim = c(0,1000))

plot(arr_delay[carrier=="AA"], 
     dep_delay[carrier=="AA"],
     xlim = c(0,1000), ylim = c(0,1000))

par(mfrow = c(1,1))

plot(arr_delay[carrier=="AA"], 
     dep_delay[carrier=="AA"],
     xlim = c(0,1000), ylim = c(0,1000))

#### Class 8 start 
### Adding text to the inside of the plot

plot(arr_delay[carrier == "UA"], dep_delay[carrier == "UA"],
     main = "Arrival vs Departure Time (UA)")
text(x=100, y = 400, label = "United airway")
text(x=100, y = 300, label = "United airway", adj = 1)
text(x=100, y = 200, label = "United airway", adj = 0)

### Adding text to the outside of the boundary 

mtext(text = "UA = United Airway", side =3)

mtext(text = "in minutes", side = 2, adj = 1)

### Resizing and coloring the plotting characers

plot(arr_delay[carrier == "UA"], dep_delay[carrier == "UA"],
     main = "Arrival vs Departure Time (UA)", cex = 0.5, col = "red")
points(arr_delay[carrier == "AA"], dep_delay[carrier == "AA"],
        cex = 0.5, col = "green")

### Changing the appearance of the texts of the plot

plot(arr_delay[carrier == "UA"], dep_delay[carrier == "UA"],
     main = "Arrival vs Departure Time ", cex = 0.5, col = "red",
     col.main = "red", font.main = 3, col.lab = "blue", font.lab = 4)
points(arr_delay[carrier == "AA"], dep_delay[carrier == "AA"],
       cex = 0.5, col = "green")

text(100, 400, "UA = United Airway", font = 2, col = "red")
text(100, 350, "AA = American Airway", font = 2, col = "green")
