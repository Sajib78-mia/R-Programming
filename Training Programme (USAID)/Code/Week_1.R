#set working directory
setwd("D:/R_programming/Practice file/Code_store_file") 
getwd()
file.create("D:/R_programming/Practice file/Code_store_file/R")
dir.create("D:/R_programming/Practice file/Code_store_file/R")
##packages
library(ggplot2)
## another way to install any packages
install.packages("ggplot.multistats")
library(ggplot.multistats)
# check which packages are already installed
installed.packages()
##
?print
?ggplot2
?install.packages 

###SESSION-02

###Logical operator
4==4
4!=4
7>6
7<6
"hello"=="bye bye"
"hello"=="hello"
"hello">"afternoon"
TRUE<FALSE
TRUE==1
FALSE==1
FALSE==0
TRUE==0
#Create your first R-object
n<-5
n
n=6
n
s<-10
S
s
my_basket <- 5
my_basket
5/5
5/0
5/-0
0/0
###Basic data type
my_numeric <- 5
my_character<-"universe"
my_logical <- TRUE
###check class
class(my_numeric)
class(my_character)
class(my_logical)

mode(my_numeric)
mode(my_character)
mode(my_logical)


typeof(my_numeric)
typeof(my_character)
typeof(my_logical)
####Create vector
my.vector <- c(1,2,3,4,5,6,7,8,9,10)

is.vector(my.vector)
as.vector(my.vector)
my.new.vector <- 1:5
my.new.vector
seq(from=20, to=50)
seq(from=20, to=50, by=2)
seq(from=21, to=49, by=2)
x <- c(a=1, b=3)
is.vector(x)
as.vector(x)