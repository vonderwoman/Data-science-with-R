#checking our working directory
getwd()
#loading data into R
library(dplyr)
customer_data =readRDS("custdata.RDS")
#treating the age and income variables
customer_data<-customer_data %>%
  mutate(age=na_if(age,0),#mutate() adds columns to a dataframe or modifies existing columns
         income=ifelse(income<0,NA,income))#the function if() turns a specific problematic value (in this case,0) to NA
#also converting -ve incomes to NA

#treating the gas_usage variable
#converting all the special code 1,2,3 to NA
customer_data <- customer_data %>%
  mutate(gas_with_rent = (gas_usage == 1),#creating the three indicator variable
         gas_with_electricity = (gas_usage == 2),
         no_gas_bill = (gas_usage == 3) ) %>%
  mutate(gas_usage = ifelse(gas_usage < 4, NA, gas_usage))#converts the special codes in the gas _isage column to NA


#treating missing values
count_missing=function(df){#defines a function that counts the number of NAs in each column of a dataframe
  sapply(df,FUN=function(col)sum(is.na(col)))
}
#applying this to our data
nacounts <- count_missing(customer_data)
hasNA = which(nacounts > 0)#applies the function to our customer_data and identify which columns have missing values,and prints the columns and counts
nacounts[hasNA]

#creating and applying treatmeant plan
#we choose specific column like health_ins because its an input variable that will be used in prediction when buildinga model
varlist <- setdiff(colnames(customer_data), c("custid", "health_ins"))
install.packages("vtreat")
library(vtreat)
treatment_plan <-
  design_missingness_treatment(customer_data, varlist = varlist)
training_prepared <- prepare(treatment_plan, customer_data)

##comparing the treated data to the original
colnames(customer_data)

colnames(training_prepared)
#observation:the prepared data has additional columns that are not in the original data

#checking if the prepared data has any missing values
nacounts <- sapply(training_prepared, FUN=function(col) sum(is.na(col)) )
sum(nacounts)#the prepared data has no missing values

#further examining the data treatment
#here we are examining the old data customer_data
htmissing <- which(is.na(customer_data$housing_type))#finds the rows where housing_type was missing
columns_to_look_at <- c("custid", "is_employed", "num_vehicles",
                        "housing_type", "health_ins")
customer_data[htmissing,columns_to_look_at] %>% head()#looks at a few columns from those rows in the original data
#columns to look at the treated data in the training_prepared
#comparing some columns from the original data and treated data
columns_to_look_at = c("custid", "is_employed", "is_employed_isBAD",
                       "num_vehicles","num_vehicles_isBAD",
                       "housing_type", "health_ins")
training_prepared[htmissing, columns_to_look_at] %>% head()
#Look at the rows and columns in the treated data(along with the isBads)
#you will notice the treated data is much neater to work with

customer_data %>%
  summarize(mean_vehicles = mean(num_vehicles, na.rm = TRUE),
            mean_employed = mean(as.numeric(is_employed), na.rm = TRUE))

################end of data cleaning,treating and managing###################

