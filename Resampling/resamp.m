function y = resamp(x, r)
    
[Length Mat]= rat(r);

Ze = zeros(1, (length(x))*Length);

Ze(1:Length:end) = x;

N = 75;

[~,beta] = kaiserparams(0.001,0.01);

Zu = conv(Ze,(Length*fir1(N-1, (1/max(Mat,Length)), kaiser(N,beta))),'SAME');

y=Zu(1:Mat:end);

end
