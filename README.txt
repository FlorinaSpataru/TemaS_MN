// Spataru Florina Gabriela 313CA TemaS Metode Numerice //

>>> Cerinta 1. Algoritmul Iterative
	Folosind informatiile din fisierul de intrare, se construieste in
primul rand matricea de adiacenta. Daca pe o pagina p1 exista link catre
o pagina p2, atunci A(p1,p2) va fi 1. Nu se ia in considerare daca pe o
pagina exista link catre ea insasi.
	Se contruieste matricea inversabila K ce contine pe diagonala
principala, in A(i,i), cate link-uri sunt pe pagina i.
	Folosind formula de pe wikipedia, se contruieste matricea M.
	Folosesc norma Frobenius pentru matricea RR-R, unde, pentru inceput
RR contine numai 1/N si R este o matrice de zerouri. Atata timp cat
norma este mai mare decat eroarea epsilon, R devine RR si se aplica
formula algoritmului Iterative.

>>> Cerinta 2. Algoritmul Algebraic
	Prima parte al algoritmului este identica, i.e. citirea din fisier,
constructia matricei de adiacenta si a matricei M cu formula.
	Nu am folosit PR_Inv.m pentru ca mi s-a parut mai usor sa folosesc
functia ce aplica algoritmul QR clasic unei matrice (gram_schmidt.m)
gasita in Libraria de Metode Numerice (LMN).
	Rezolv apoi cele n sisteme de ecuatii folosind functia ss_tri.m
de asemenea din LMN si calculez R cu formula.

>>> Cerinta 3. Gradul de Apartenenta
	Am citit lista de adiacenta, fara de acesta data sa construiesc
matricea de adiacenta, doar pt a putea citi valorile de la sfarsitul
fisierului -> val1 si val2.
	Creez un nou fisier .out ce va contine pe prima linie N, apoi
rezultatul algoritmului Iterative, apoi cel al algoritmului Algebraic.
Sortez descendent rezultatul de la Algebraic si apelez functia
Apartenenta.m pentru fiecare valoare.
	Functia Apartenenta.m foloseste exact modelul functiei u(x) data
in enuntul temei. Numerele a si b au fost alese pur intamplator.

///////////////////////
	