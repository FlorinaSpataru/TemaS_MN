function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out

	file1 = fopen(nume, 'r')
	N = fscanf(file1,'%d',1); % cate pagini exista in lista de adiancenta


	for i = 1:N
		node = fscanf(file1,'%d',1); % numarul paginii
		node_neigh = fscanf(file1,'%d',1); % numarul de link-uri ce urmeaza
		for j = 1:node_neigh
			value = fscanf(file1,'%d',1);
		end
	end

	% se citesc din fisier valorile vechi pentru d si eps -> val1, val2
	val1 = fscanf(file1,'%f',1); 
	val2 = fscanf(file1,'%f',1);

	file2 = fopen(strcat(nume,'.out'),'wt'); % deschidem fisierul pentru scriere

	fprintf(file2,'%d\n',N);
	fprintf(file2,'%f\n',Iterative(nume,d,eps));
	fprintf(file2,'\n');
	fprintf(file2,'%f\n',Algebraic(nume,d));
	fprintf(file2,'\n');

	R1 = Iterative(nume,d,eps);
	R2 = Algebraic(nume,d);

	[S, I] = sort(R2,'descend');
	
	for i = 1:N
		fprintf(file2,'%d %d %f\n',i,I(i),Apartenenta(S(i),val1,val2));
	end

	fclose(file2);
end