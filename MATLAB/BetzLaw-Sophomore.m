% Final Script
% Betz's Law
% Created: Mar 8, 2018 by Dimitrije Prosevski
%
% Input Variables
% xRange = range of x axis/velocity
%
% Output Variables
% v - v2/v1 ratio
% P - P/Po ratio
% pmax - maximum power
% Vratio - ratio of v1/v2 for the maximum power
% proof - proof that 1/3 is the most efficient ratio
%
% Parameter Values (non-built-in constants)
% none
%
% Input Section
clear
clc
xRange = 0:0.01:1; % the range of v for the x-axis
%
% Calculation Section
maxRange = size(xRange,2);

while(i~=maxRange)
    i=1:maxRange; % i goes from 1 to 101
    v(i) = xRange(i);  % v = v2/v1
    P(i) = 0.5*(-v(i).^3-v(i).^2+v(i)+1); % P = P/P0 
end

pmax = (max(P)); % maximum point on the curve 
Vratio = v(P==pmax); % a point at which maximum occurs
proof = 0.5*(-Vratio.^3-Vratio.^2+Vratio+1)*100; % proof for the max efficiency
%
% Output Section
fprintf('Theoretical maximum amount of kinetic energy that can be extracted from the wind is %1.1f percent.  \n', pmax*100) % *100 to convert to percent
fprintf('It occurs when the ratio of the (downstream wind speed):(upstream wind speed) => 1:3 = %1.2f.  \n', Vratio) % Ratio 1/3 = 0.33

fprintf('To prove we can plug back in Vratio = 1/3 instead of v2/v1 into the equation for max efficiency ')
fprintf('P = 0.5*(-Vratio^3 - Vratio^2 + Vratio + 1)*100 = %1.1f percent.   \n', proof)

fprintf('\nP = Power remaining in the wind downstream of the wind turbine \n')
fprintf('Po = Initial power available in the upstream wind   \n')
fprintf('v1 = Velocity of the upstream wind   \n')
fprintf('v2 = Velocity of the downstream wind   \n')
% plotting v and p, maximum p is marked on the graph
plot(v, P, Vratio, pmax, 'o'), xlabel('v2/v1'), ylabel('P/Po'), title("Plot of Betz's Law (P/Po versus v2/v1)")
