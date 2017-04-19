A = [1 5 0 0; 5 2 6 0;0 6 3 7; 0 0 7 4] ;
X1 = eig(A(1,1));
Y1 = [1];
X2 = eig(A(1:2,1:2));
Y2 = [2; 2];
X3 = eig(A(1:3,1:3));
Y3 = [3; 3; 3];
X4 = eig(A);
Y4 = [4; 4; 4; 4];
X5 = [0;0];
Y5 = [0;5];
plot(X1, Y1, 'bx-' , X2, Y2, 'gx-' , X3, Y3, 'rx-' , X4, Y4, 'cx-', X5, Y5, 'w.');
xlabel('eigenvalue')
ylabel('size of principal submatrix')