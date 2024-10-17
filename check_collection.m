function flag = check_collection(coupons)
    
    flag = 1;
    for i = 1:length(coupons)
        if(coupons(i) == 0)
            flag = 0;
        end
    end
    
end