###
#
# Problem 6.4
#
# Using the customers data, extract a subset of customers that are married and
# have an income of more than $50,000.
#
# What percentage of these customers have health issues?
# How does this percentage differ from that for the whole dataset?
#
###
library(ggplot2)

# Loading the data in a dataframe 
custdata <- read.table(file.choose("Your file location"),header=TRUE,sep='\t')
summary(custdata$health.ins)
summary(custdata$age)

# extract a subset of customers that are married and have an income of more than $50,000.
custdata <- subset(custdata, (custdata$marital.stat == "Married" & custdata$income > 50000))
summary(custdata$health.ins)
summary(custdata$age)

