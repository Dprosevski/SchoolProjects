clear
clc
format longG

N = [5, 10, 20]; %matrix size

fprintf("For N = %d\n", N(1));
a = [1;1;1;1]; %sub
b = [1,2,3,4,5]; %right vector
c = [2;2;2;2]; %sup
d = [3;3;3;3;3]; %diag
triD(a, d, c, b, N(1));

fprintf("\n\n\n\n\nFor N = %d\n", N(2));
a = [1;1;1;1;1;1;1;1;1]; %sub
b = [1,2,3,4,5,6,7,8,9,10]; %right vector
c = [2;2;2;2;2;2;2;2;2]; %sup
d = [3;3;3;3;3;3;3;3;3;3]; %diag
triD(a, d, c, b, N(2));

fprintf("\n\n\n\n\nFor N = %d\n", N(3));
a = [1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1]; %sub
b = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]; %right vector
c = [2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2]; %sup
d = [3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3]; %diag
triD(a, d, c, b, N(3));

% tridiagonal function
function x = triD(a, d, c, b, n)
    bInitial = b;
    %output A matrix
    A = zeros(n);
    for i = 1:n
        for j=1:n
            if i == j + 1
                A(i,j) = a(1);
            elseif i == j
                A(i,j) = d(j);
            elseif i == j - 1
                A(i,j) = c(1);
            end
        end
    end
    fprintf("Matrix A:\n");
    disp(A);
    
    %output b right hand vector
    fprintf("Vector b = [ ");
    for i = 1:length(b)
        fprintf("%d ", b(i));
    end
    fprintf("]\n");
    
    %tridiagonal algorithm
    for i = 2:n
        xMult = a(i-1) / d(i-1);
        d(i) = d(i) - xMult*c(i-1);
        b(i) = b(i) - xMult*b(i-1);
    end
    x(n) = b(n)/d(n);
    for i = n-1:-1:1
        x(i) = (b(i) - c(i) * x(i+1))/d(i);
    end
    
    %output x vector
    fprintf("\nCalculated vector x");
    fprintf("\nVector x = [ ");
    for i = 1:length(x)
        if (i == 11) %new line so the output can fit
            fprintf("\n\t\t\t");
        end
        fprintf("%1.10f ", x(i));
    end
    fprintf("]\n");
    
    %residual r=Ax-b
    fprintf("\nResidual r=Ax-b");
    r = mtimes(A, x') - bInitial';
    
    %output r vector
    fprintf("\nVector r = [ ");
    for i = 1:length(r)
        if (i == 11) %new line so the output can fit
            fprintf("\n\t\t\t");
        end
        fprintf("%1.10f ", r(i));
    end
    fprintf("]\n");
end %end tridiagonal function

