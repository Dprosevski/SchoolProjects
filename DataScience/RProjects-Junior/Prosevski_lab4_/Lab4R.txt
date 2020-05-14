#Calculates sales statistics of Samsung notebooks from BestBuy sold in a year
# Author: Dimitrije Prosevski
# Date: Feb 17th, 2019

# a. Input and output of product name, price and pieces sold respecitvely
print("a. Product name, price and pieces sold respecitvely:");
for (i in 1:5){
	print(name[c(i)])
	print(price[c(i)])
	print(sold[c(i)])
}
name <- c("Notebook 7", "Notebook 9", "Galaxy book", "Notebook Odyssey", "Chromebook") 
price <- c(650, 950, 1120, 1200, 250)
sold <- c(150, 140, 120, 170, 130)

# b. finding average
avgPrice <-  mean(price,na.rm = TRUE)
print(paste0("b. Average price of all products is: ", avgPrice))

# c. sold products above price of average
aboveAvg <- which(price > avgPrice)
promptAboveAvg <- name[c(aboveAvg)]
countProducts <- length(aboveAvg)
print(paste0("c. The number of products sold above the average price is: ", countProducts))
print(promptAboveAvg);

# d. the total income of transactions whose price is above the average
totalIncomeAA <- sum(price[c(aboveAvg)] * sold[c(aboveAvg)])
print(paste0("d. The total income of transactions whose price is above the average is: ", totalIncomeAA))

# e. the total income from each product
totalIncomeEach <- price * sold
print("e. Total income of each product respecitvely:")
print(totalIncomeEach)

# e. the total income generated from all sales
totalIncome <- sum(price * sold)
print(paste0("f. The total income generated from all sales is: ", totalIncome))