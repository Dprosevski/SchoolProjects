% Author: Dimitrije Prosevski
% Date Completed: 10 Feb 2019
% Major: Computer Science
% Minor: Math
% Letting the user input a matrix with "n" dimensions and calculate 
% eigeigen-value, eigen-vectors, ratio of eigen-values, and graph the matrix
clear
clc
close
option = ' ';
% while loop to make sure the right characters are chosen
while ~ismember(option, {'R','M', 'r', 'm'})
    option = input('Choose the random or manual input of the matrix by inputing R or M characters:', 's');
end
% if statement to recognize which input method to run
if (option == 'r' || option == 'R')
    n = input('Input the dimension of the matrix:\n');
    rmNumMin = input('Matrix numbers will be randomly generated, type the minimum value limit (i.e. 0):\n');
    rmNumMax = input('Type the maximum value limit (i.e. 10):\n');
    A = randi([rmNumMin, rmNumMax], [n,n]);
    [X, V, D, r, listEig] = calc(A);
    prompt(A, V, listEig, r);
end
% if statement to recognize which input method to run
if (option == 'm' || option == 'M')
    fprintf('\nPlease be sure to input a square matrix (2x2, 3x3 or similar) for proper functionality.\n');
    A = input('Enter matrix in this format:    [1 2 3; 4 5 6; 7 8 9]\n');
    B = cell(1,1);
    [X, V, D, r, listEig] = calc(A);
    prompt(A, V, listEig, r);
end
% Function calc that does all the calculations and graphs the matrix
function [X, V, D, r, listEig] = calc(X)
    [V, D] = eig(X);
    listEig = diag(D);
    r = min(listEig)/max(listEig);
    G = graph(X,'upper');
    figure;
    p = plot(G); 
    title("Plot of the matrix A");
    axis equal
end
% function prompt the output 
function prompt(X, Y, Z, W)
    fprintf('\nYour matrix is:\nA = \n');
    disp(X);
    fprintf('\nEigen-vectors of A:\nV = \n');
    disp(Y);
    fprintf('\nEigen-values of A:\nlistEig = \n');
    disp(Z);
    fprintf('\nRatio of eigen-values of A:\nr = \n');
    disp(W);
end