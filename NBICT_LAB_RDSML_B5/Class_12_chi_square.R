op1 =c(22,28,72)
op2 =c(26,62,22)
op3 =c(23,26,66)

production = data.frame(op1,op2,op3, row.names= c("shift1","shift2","shift3"))
production

chisq.test(production)