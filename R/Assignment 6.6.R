# Import the dataset
dating = read.table(file.choose(), header=T, sep=",")

# Problem 1: Let's do a scatterplot to visualize the relation
ggplot(dating, aes(x=Miles,y=Games)) + geom_point() + stat_smooth(method="lm")

# Problem 2: Create a predictive model
lm(Games ~ Miles, dating)

# Visualize the model
ggplot(dating, aes(x=Miles,y=Games)) + geom_point() + stat_smooth(method="lm")
lm(Games ~ Miles, dating)

# Problem 3: Clustering the data
set.seed(20)
datingCluster = kmeans(dating[,1:2],3,nstart=20)
datingCluster
ggplot(dating, aes(Miles,Games, color=datingCluster$cluster)) + geom_point()
