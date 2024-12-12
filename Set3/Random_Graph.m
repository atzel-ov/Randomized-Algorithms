function G = Random_Graph(n,p)

    V = zeros(n,1);
    for i =1:n
        V(i) = i;
    end

    A = zeros(n,n);
    for i = 1:n
        for j = i:n
            if(i == j)
                A(i,j) = 0;
            else
                A(i,j) = (rand <= p);        
            end
        end
    end
    A = A + A';

    E = [];
    for i = 1:n
        for j = i:n
            if(A(i,j) == 1)
                E = [E; [i, j]];
            end
        end
    end

    G = {V, A, E, n, p};

