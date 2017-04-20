import bisection.*;
clear;
n=10;
vector = rand(1, n-1)
A = full(gallery('tridiag', vector, rand(1, n), vector));
kappa = cond(A);
E_echt = sort(eig(A));
E_bis = bisection(A, 0, 1, 10^(-10));