#a common data science project is to sort revenue records and then calculate what fraction of total revenue is achived
#in a given sorting key
#R can be done easily by breaking this task into small steps
#our example data
data<-data.frame(revenue=c(2,1,2),
                 sort_key=c("b","c","a"),
                 stringsAsFactors = FALSE)
print(data)

#assign our data to "." value.The original data will remain in the data variable
.<-data
#use order command to sort the rows.drop=False is a good way to include because it will convert result to vector
.<-.[order(.$sort_key),,drop=FALSE]
.$ordered_sum_revenue<-cumsum(.$revenue)
.$fraction_revenue_seen<-.$ordered_sum_revenue/sum(.$revenue)
#assigning "." to result
result<-.
#printing the result
print(result)

#######################end of project######################