### factors in R
student.height <- c(100,106,121,111,109,111,103,117,114,200)
mean(student.height)
summary(student.height)

airports <- c("DHA","CAL","NYC","DHA","DHA","DEL","CAl")
summary(airports)
factor(airports)
airports <- factor(airports)
summary(airports)

birt_month <- c("march",'april',"january","march","june",'march',"april","june")
summary(birt_month)
birt_month <- factor(birt_month,order=TRUE,
                     levels=c("january","febrary","march","april","may","june","july","august","october","november","december"))
summary(birt_month)
#####list in R
a <- c(1,4,6)
b <- c("Red","Blue")
C <- "welcome"

my_list <- list(a,b,C)
my_list
###naming the list item
named_list <- list(pieces=a,color=b,mesage=C)
named_list
named_list["mesage"]
named_list$color
