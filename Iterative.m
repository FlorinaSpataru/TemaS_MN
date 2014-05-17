function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

	file = fopen(nume, 'r')
	N = fscanf(file,'%d',1); % cate pagini exista in lista de adiancenta
	A = zeros(N,N); % initializez matricea de adiacenta

	value = 0; % va fi valoarea unui link

	for i = 1:N
		node = fscanf(file,'%d',1); % numarul paginii
		node_neigh = fscanf(file,'%d',1); % numarul de link-uri ce urmeaza
		for j = 1:node_neigh
			value = fscanf(file,'%d',1); 
			A(i,value) = 1;
			value = 0;
		end
	end
	% am construit matricea de adiacenta

	K = zeros(N,N);
	% construim matricea K pt a aplica algoritmul iterative
	% K este inversabila

	for i = 1:N 
		A(i,i) = 0; % nu ne intereseaza daca o pagina are link catre ea insasi
	end

	count = 0; % numar cate link-uri contine o pagina

	for i = 1:N
		for j = 1:N
			if A(i,j) == 1
				count++;
			end
		end
		K(i,i) = count; % si le adaug pe diagonala principala in K 
		count = 0;
	end

	M = (inv(K)*A)'; % aplic formula pt M

	RR = zeros(N,1);
	RR(:) = 1/N;
	R = zeros(N,1);

	while (norm(RR-R,'fro') >= eps)
		R = RR;
		RR = d*M*RR + (1-d)/N*ones(N,1); % aplic formula de la algoritmul iterative
	end

end