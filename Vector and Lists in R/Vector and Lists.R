#build an example vector
#here we are building vectors and list

example_vector <-c(10,20,30)
example_list <-list(a=10,b=20,c=30)

#demo of vector and list usin []
example_vector[1]
example_list[1]
#you notice when use [] it returns a new short list,not the item

#demostrates vector and list using [[]]
#
example_vector[[2]]
example_list[[2]]

#vectors and list can be indexed by vecors of logical,integers and characters
example_vector[c(FALSE,TRUE,TRUE)]
example_list[c(FALSE,TRUE,TRUE)]
#the sign $ is used in listing for a short hand like example [["b"]]
example_list$b
example_list[["b"]]

#defining a value we are interested and store it in x variable
x<-1:5
print(x)

#assigning cumsum to x variable
x<-cumsum(x)
print(x)

################end of exercise##############