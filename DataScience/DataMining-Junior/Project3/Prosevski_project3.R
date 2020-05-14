myData = read.csv("googleplaystore.csv", header=TRUE)view(data)
write.arff(x =mydata ,file= "googleplaystoreARFF.arff")