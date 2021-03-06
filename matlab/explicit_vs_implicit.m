import Householder_explicit.*;
import Householder_implicit.*;
import Apply_Q.*;

clear;
n=1000;
cond = 10^8;
A = rand(n);
[U,S,V] = svd(A,0);
S = eye(size(S));
S(1,1) = cond; %conditiegetal
A = U * S * V;
b = rand(n,1);
x_matlab = A\b;

%explicit method
tic;
[Q_exp,R_exp] = Householder_explicit(A);
y_exp = Q_exp'*b;
x_exp = R_exp\y_exp;
timing_exp = toc;

%implicit method
tic;
[L_imp, R_imp] = Householder_implicit(A);
y_imp = Apply_Q(L_imp, b);
x_imp = R_imp\y_imp;
timing_imp = toc;

%compare
disp(timing_exp);
disp(timing_imp);
dx_exp = norm(x_exp-x_matlab)/norm(x_matlab);
disp(dx_exp);
dx_imp = norm(x_imp-x_matlab)/norm(x_matlab);
disp(dx_imp);
rb_exp = norm(b-A*x_exp)/norm(b);
disp(rb_exp);
rb_imp = norm(b-A*x_imp)/norm(b);
disp(rb_imp);



