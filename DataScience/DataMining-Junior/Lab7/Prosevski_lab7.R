# Lab 7 Association Rule Analysis on Mushroom dataset from arules
# Author: Dimitrije Prosevski
# Date: March 31st, 2019

install.packages("arules")
require(arules)
data(Mushroom)
summary(Mushroom)
mod1 = apriori(Mushroom, parameter=list(support=0.40, confidence=0.60, minlen=2))
inspect(sort(mod1, by="lift")[1:10])