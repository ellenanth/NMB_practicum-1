C = [1 5 0 0;
    5 2 6 0 ;
    0 6 3 7;
    0 0 7 4 ];
 E_echt_C = eig(C);
 E_bis_C = bisection(C,-2,6,10^(-2));