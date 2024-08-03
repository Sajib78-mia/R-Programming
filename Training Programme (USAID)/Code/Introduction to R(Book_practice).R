####data manipulation
X <- c(11,12,34)
X[2]
X[1:3]
X[-2]
i <- c(TRUE,FALSE,FALSE)
X[i]
X[X<34]
X<34
X[c(FALSE,TRUE,FALSE)]
names(X) <-c("a","b","c")
X
X[c("b","c")]
X[2]<-100
###
x<-c(1,5,3,2,8)
x
x[8]<-20
x
###
flow<-read.csv("~/R_programmig_all_file/Score.csv")
dim(flow)
head(flow)
flow[1:15,1:3]
flow[1:5,]
flow[1:5,"Method"]
flow[1:5,c("Initial.score","Final.score")]
quantile(flow$Initial.score,0.1, na.rm=TRUE)
flow[flow$Initial.score<2.4,]
## Subset
subset(flow, Initial.score<2.4)
subset(flow, Initial.score>2.4 & Final.score==11)
subset(flow, Method=="Lecture"|Method=="CAI")
subset(flow,Method %in% c("Lecture","CAI"))
head(flow)
flow[,"Method"]
flow[, "Method", drop = FALSE]
116
