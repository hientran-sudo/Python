library(ggplot2)
data = read.table(file.choose("Your File Location"),header=TRUE,sep='\t')
View(data)

summary(data$health.ins)
summary(data$age)


