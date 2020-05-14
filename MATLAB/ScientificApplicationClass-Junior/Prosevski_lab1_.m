% Calculates the power based on current and voltage given
% Author: Dimitrije Prosevski
% Date: Jan 20th, 2019

% Creating variables for current and voltage, then solving
clear
V = 10; % Voltage in Volts
I = 2;  % Current in Amperes
P = V*I; % Power = Voltage * Current in Watts

% Displaying Output
clc
disp ('The power in Watts is: '), disp (P)