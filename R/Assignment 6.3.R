###
#
# Problem 6.3
#
# Create a bar chart for housing type using the customer data.
# Make sure you remove the 'NA' type. Use a subset function.
#
###
library(ggplot2)

# Loading the data in a dataframe 
custdata <- read.table(file.choose("Your file location"),header=TRUE,sep='\t')
ggplot(custdata) + geom_bar(aes(x=housing.type), fill="blue")

# Remove NA from the bar chart
custdata <- subset(custdata, (custdata$housing.type != "NA"))
ggplot(custdata) + geom_bar(aes(x=housing.type), fill="blue")

