incomedata = read.table(file.choose("Your File Location"),header=TRUE,sep=',')
View(incomedata)

p <- density(incomedata$Median_Income)
plot(p)

polygon(p,col="blue")
