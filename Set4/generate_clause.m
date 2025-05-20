function [n, m, K, clauses, s, lit_clauses] = generate_clause(str)
    
    if(strcmp(str, 'simple'))
        n = 3; K = 2; m = n;
        clauses = [1, 2; 2, 3];
        s = [1; 0; 1];
        lit_clauses = [1, 0; 0, 1];
    else
        n = 100; m = 10; K = 100*n;
        clauses = genereate_2clauses(K,n);
        s = (sign(randn(n, 1)) + 1)/2;
        lit_clauses = generate_2litClauses(K,s,clauses);
    end