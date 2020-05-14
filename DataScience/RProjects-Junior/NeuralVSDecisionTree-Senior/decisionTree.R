data(iris)
names(iris)
table(iris$Species)
#install if necessary
#install.packages("ggplot2")
library(ggplot2)
qplot(Petal.Width, Sepal.Width, data=iris, colour=Species, size=I(4))


#install.packages("rpart")
#install.packages("rpart.plot")
library(rpart)
library(rpart.plot)
myTree <- rpart(formula = Species ~ ., iris, method = "class")
rpart.plot(myTree, type=2, extra=101)

iris[iris$Petal.Length<2.5,5]
iris[iris$Petal.Length>2.5&iris$Petal.Width<1.8,5]
iris[iris$Petal.Length>2.5&iris$Petal.Width>1.8,5]

