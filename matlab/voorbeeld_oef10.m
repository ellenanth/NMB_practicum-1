import bisection.*;
clear;
n=100;
range1 = [1 50]; %range of integers
range2 = [-25, 25];
A = full(gallery('tridiag', n, randi(range1, 1, n-1), randi(range2, 1, n), randi(range1, 1, n-1)));
E_echt = eig(A);
E_bis = bisection(A, 0, 5, 10^(-1))