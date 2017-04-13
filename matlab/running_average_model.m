X = 0:30;
Y = zeros(31,1);
%load u_model and y_model from .mat files
load('model.mat');
m = size(u_model,1);
load('validate.mat');
s = size(u_validate,1);

for n = 1:31
    %create A and b
    A = zeros(m-n+1,n);
    for i = 1:n
        A(:,i) = u_model(n-i+1:m-i+1,1);
    end
    b = y_model(n:m,1);
    %solve to x using algorithm 11.2
    [L, R] = Householder_implicit(A);
    y = Apply_Q(L, b);
    x = R\y;
    %evaluate this model
    B = zeros(s-n+1,n);
    for i = 1:n
        B(:,i) = u_validate(n-i+1:s-i+1,1);
    end
    y_calculated = B*x;
    norm_r = norm(y_validate(n:s)-y_calculated,2);
    Y(n) = norm_r;
end
plot(X,Y,'b.-');
xlabel('aantal tijdsvertragingen n-1');
ylabel('residual norm');