function clauses = genereate_2clauses(K,n)

    clauses = [];
    while(1)
        i_1 = randi([1,n]);
        i_2 = randi([1,n]);
        if(i_1 == i_2)
            continue
        else
            clauses = [clauses; i_1, i_2];
        end
    
        if(size(clauses,1) == K)
            break
        end
    end