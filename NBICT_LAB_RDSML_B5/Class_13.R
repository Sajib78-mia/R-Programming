
###Two independent sample t test

female <- c(23,23,23,25,27,23,25,44)
male <- c(31,25,35,25,25,28,24,48,27,33,26,39)
var.test(x=female, y=male)

t.test(x=female, y= male, var.equal = TRUE)

###
mc1 <- c(150,152,154,152,151)

mc2 <- c(156,155,158,155,154)

mc3 <- c(144,162,177,150,140)

var.test(x=mc1, y=mc2)
t.test(x=mc1, y=mc2, var.equal =T)

var.test(x=mc1, y=mc3)

t.test(x=mc1,y=mc3,var.equal = F)