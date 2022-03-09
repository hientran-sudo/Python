###
#
# Problem 6.5
#
# In the customers data, do you think there is any correlation between age, income, and number of vehicles? 
# Report your correlation numbers and interpretations.
#
###
library(ggplot2)

# Loading the data in a dataframe 
custdata <- read.table(file.choose("Your file location"),header=TRUE,sep='\t')

# First, let's plot the dataset in a scatterplot. Here is how to do it:
ggplot(custdata, aes(age, income, color = num.vehicles)) + geom_point() + scale_y_continuous(labels = scales::comma)

# Ages over 100 are assumed to be outliers. Remove them as well as empty corresponding datapoints 
custClean <- subset(custdata, custdata$age <= 100 & custdata$income >= 0  & !(is.na(custdata$age) | is.na(custdata$income) | is.na(custdata$num.vehicles)))

# The following steps will use the cleaned data and look at the correlation between income and the number of vehicles
cor(custClean$income, custClean$num.vehicles)

# Let’s double check this by plotting the dataset in a scatterplot:
ggplot(custClean, aes(income, num.vehicles, color = age)) + geom_point() + scale_x_continuous(labels= scales::comma)

# Next, let's look at correlation between number of vehicle and age
cor(custClean$num.vehicles, custClean$age)
