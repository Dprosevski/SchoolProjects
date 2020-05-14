clear
clc

syms x;
eps = 0.000001; % for error less 10^-6
inputFunction = input('Input your function of "x"');
f=inline(inputFunction);
f1=inline(diff(f(x)));
x = input('Your initial guess:');

% prints
fprintf('\n\nn\t xn\t\t\t\t\t f(xn)');
fprintf('\n%d\t %1.16f\t %e\n', i, x, f(x));

% Newton's method
for i=0:5000
    xn = x;
    x = xn - (f(x)/f1(x));
    if(abs(x - xn) < eps)
        fprintf('Converge\n\n');
        break;
    elseif(i == 5000)
        fprintf('Diverge\n\n');
        break;
    end
    fprintf('\n%d\t %1.16f\t %e\n', i+1, x, f(x));
end