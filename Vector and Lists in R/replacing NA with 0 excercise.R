#for example we can replace all missing values by "NA" in a vector with zero as shown in the script below'
d<-data.frame(x=c(1,NA,3))
print(d)
#replacing null which is "NA" with 0 value
d$x[is.na(d$x)] <-0
print(d)

#########3end of exercise##########