function Q = rotate(P,e)
    
    v_k = e(1);
    v_i = e(2);

    idx = find(P == v_i);

    P_1 = P(1:idx);
    P_2 = P(idx+1:end);

    P_2 = flip(P_2);

    Q = [P_1; P_2];
    

