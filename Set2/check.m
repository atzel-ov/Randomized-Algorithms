function FOUND = check(P,G,str)
    
    V = G{1}; A = G{2};
    n = length(V);
    if(strcmp(str,'path'))
        if (length(P) == n)
            FOUND = 1;
        else 
            FOUND = 0;
        end
    else
        if (P(1) == P(end) && length(P) == n+1)
            FOUND = 1;
        else 
            FOUND = 0;
        end
    end
    