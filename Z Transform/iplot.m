function iplot(b, a)

    Hval = filter(b(find(b,1):end), a(find(a,1):end), [1 zeros(1,999)]);
    
    
    if(abs(roots(a))<1)% Stable 
        stem(Hval(1:20),'FILLED');
    elseif (roots(a) == 0);% FIR 
        stem(Hval, 'FILLED');
    else %IIR 
        f = find(cumsum(Hval.^2)/sum(Hval.^2) > .999, 1);
        if f < 10;
            f = 10;
        end
        if f > 100;
            f = 100;
        end

        stem (-(find(b,1)) : f - (find(b,1)) - 1, Hval(1:f), 'FILLED');
    end
end

