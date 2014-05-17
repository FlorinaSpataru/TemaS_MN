function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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

	% aplic algoritmul iterative
	T = (eye(N)-d*M);
	[Q W] = gram_schmidt(T);

	I = eye(N);

	for i = 1:N
		T(:,i) = ss_tri(W,Q'*I(:,i));
	end

	R = T * (1-d)/N*ones(N,1);

end
