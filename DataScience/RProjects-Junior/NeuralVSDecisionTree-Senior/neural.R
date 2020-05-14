library(neuralnet)
set.seed(101)
size.sample <- 50
iristrain <- iris[sample(1:nrow(iris), size.sample),] # get a training sample from iris
nnet_iristrain <- iristrain

# Binarize the categorical output
nnet_iristrain <- cbind(nnet_iristrain, iristrain$Species == 'setosa')
nnet_iristrain <- cbind(nnet_iristrain, iristrain$Species == 'versicolor')
nnet_iristrain <- cbind(nnet_iristrain, iristrain$Species == 'virginica')

names(nnet_iristrain)[6] <- 'setosa'
names(nnet_iristrain)[7] <- 'versicolor'
names(nnet_iristrain)[8] <- 'virginica'

head(nnet_iristrain) 
nn <- neuralnet(setosa+versicolor+virginica ~ 
                  Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, 
                data=nnet_iristrain, hidden=c(3))

plot(nn) 