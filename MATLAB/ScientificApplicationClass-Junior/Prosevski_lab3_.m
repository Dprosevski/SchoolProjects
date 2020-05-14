% Calculates the distance and the time it takes to travel between 2 cities
% Author: Dimitrije Prosevski
% Date: Feb 3rd, 2019
clear
clc
cities = ["1. St. Catharines" "2. St. Thomas" "3. Tobermory" "4. Toronto" "5. Windsor"];
distances = [0 210 366 111 371; 210 0 376 208 187; 366 376 0 285 439; 111 208 295 0 371; 371 187 439 371 0];
hoursRequired = [0 2.5 4 1.5 4.1; 2.5 0 4.1 2.6 1.9; 3.9 4.2 0 3.4 5.3; 1.3 2.3 3.3 0 4.3; 3.8 2.2 5.1 4.6 0];

% prompt data and questions and take input
disp(cities);
loc1 = input('Choose a starting point by entering the number of the city: ');
loc2 = input('Choose a destination point by entering the number of the city: ');

% calling the function and substring for cities for clarity
trip = dist(loc1, loc2, distances, hoursRequired * 60);
city1 = extractAfter(cities(loc1),3);
city2 = extractAfter(cities(loc2),3);

% prompt the final output
fprintf("\nYou will travel %1.0f miles from %s to %s and it will take approximately %1.0f minutes.\n", trip(1), city1, city2, trip(2));

% function that calculates distance and time traveled
function d = dist(loc1, loc2 ,distances, hoursRequired)
    d = [distances(loc1, loc2), hoursRequired(loc1, loc2)];
end