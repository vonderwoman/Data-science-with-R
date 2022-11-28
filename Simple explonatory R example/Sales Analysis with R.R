#check you working directory
getwd()
#import your .csv file to your global environment
data <- read.csv("sales.csv", header =TRUE, sep= ",")
#viewing your data
data
#to have a quick look at data, we often use head() and tail()
head(data)
tail(data)
#viewing our data
View(data)
#checking the datatype for our data
str(data)

#reach into our data and explore more variables
min(data$price)
max(data$price)
range(data$price)

#checking the summary of the data

summary(data)

#Loading,Viewing, and working with R data
