%Calculates sales statistics of Samsung notebooks from BestBuy sold in a year
% Author: Dimitrije Prosevski
% Date: Jan 27th, 2019

% a. number of Samsung notebooks from BestBuy sold in a year
clear
clc
% Input and output of product name, price and pieces sold respecitvely
name = ["Notebook 7" "Notebook 9" "Galaxy book" "Notebook Odyssey" "Chromebook"]; 
price = [650 950 1120 1200 250];
sold =  [150 140 120 170 130];
fprintf("a. Product name, price and pieces sold respecitvely:\n");
for i = 1:5, fprintf("%s \t",name(i)), end, disp(newline); %for loop
fprintf("$%1.0f \t\t\t ", price); disp(newline);
fprintf("x%1.0f \t\t\t ", sold);

% b. finding average
avgPrice = mean(price);
fprintf("\n\n\nb. Average price of all products is $%1.2f \n", avgPrice)

% c. sold products above price of average
aboveAvg = find(price > avgPrice);
promptAboveAvg = name(aboveAvg);
countProducts = length(aboveAvg);
fprintf("\n\nc. There are %1.0f products sold above the average price: \n", countProducts);
fprintf("%s \t\t", promptAboveAvg);

% d. the total income of transactions whose price is above the average
totalIncomeAA = sum(price(aboveAvg) .* sold(aboveAvg));
fprintf("\n\n\nd. The total income of transactions whose price is above the average is: $%1.2f\n", totalIncomeAA);

% e. the total income from each product
totalIncomeEach = price .* sold;
fprintf("\n\ne. Total income of each product respecitvely: \n");
fprintf("$%1.2f \t\t", totalIncomeEach);

% e. the total income generated from all sales
totalIncome = sum(price .* sold);
fprintf("\n\n\nf. The total income generated from all sales: $%1.2f.\n", totalIncome);