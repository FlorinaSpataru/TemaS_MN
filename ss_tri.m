function x=ss_tri(A,b)
% functie din lmn
% rezolvare sistem superior triunghiular
% Intrari: 
%		A=matrice sistem
%	         b=vector termeni liberi
% Iesiri: 
%		  x=solutia sistemului
	[n,n] = size(A);
	x = zeros(n,1);
% se calculeaza termenul initial;
	x( n ) = b( n ) / A( n, n );
% se aplica formula de recurenta
	for i = n - 1 : -1 : 1
		x( i ) = ( b( i ) - A( i, i+1 :n ) * x( i+1 : n ) ) / A( i, i );  
        endfor
        
endfunction