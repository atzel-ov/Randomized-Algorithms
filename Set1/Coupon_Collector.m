function collected_coupons = Coupon_Collector(n)
    
    collected_coupons = zeros(n,1);
    while(true)
        idx = randi(n);
        collected_coupons(idx) = collected_coupons(idx) + 1;
        if(check_collection(collected_coupons))
            break
        end
    end

end