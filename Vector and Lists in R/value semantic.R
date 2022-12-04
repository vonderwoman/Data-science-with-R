#create an example and refer it to d
d<-data.frame(x=1,y=2)
#creating an additional reference d2 to the same data
d2<-d
#alter a value refereed to by d
d$x<-5
#printing the result of d
print(d)
#print(d2) which is still reference of d
print(d2)
#lets try to change the values of d2
d2$x<-7
d2$y<-10
print(d2)

#################3end of exercise##############3