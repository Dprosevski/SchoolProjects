# Finds all the values higher than "m" value from "TOTAL_EXPENDED" (155)
# and creates a new column with 1 inside of cells for those higher than "m"
# and 0 for those that are smaller.
# Author: Dimitrije Prosevski
# Date: Feb 24th, 2019

myData = read.csv("Projects_Base_Data_Set.csv", header=TRUE)
columnNum = which(colnames(myData)=="TOTAL_EXPENDED")

arrayTr <- t(myData[c(columnNum)])
arrayTr = as.numeric(gsub(",", "", arrayTr))
m = 100000000

findRows <- function(x){
	findElem = which(x>m) #find projects higher than m
	newColumn <- array(0,dim=c(length(x)))

	for (i in 1:length(findElem)){
		temp = findElem[c(i)]
		newColumn[c(temp)] = 1
	}
	
	write.csv(newColumn , file = "NewData.csv"
		,row.names=FALSE, append = TRUE)

	print("The following rows of the new column were made to 1:")
	which(newColumn == 1)

}

findRows(arrayTr)