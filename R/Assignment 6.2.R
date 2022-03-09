###
#
# Problem 6.2
#
# Plotting density of income
#
###

# Loading the data in a dataframe 
incomedata = read.table(file.choose("Your file location"),header=TRUE,sep=',')
View(incomedata)

# Density plot
p <- density(incomedata$Median_Income)
plot(p)

# Filled density plot
polygon(p, col="blue")
