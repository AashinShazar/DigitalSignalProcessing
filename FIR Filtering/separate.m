function [sr, sc] = separate(s, fs)
	[N,beta] = kaiserparams(.0018, .001);  
    
	n = kaiserfilt(N, (2*(((1209+941))/2)/fs), beta);           
	         
	arr = zeros(1,N);     
	arr(N-(N-1)/2) =1;
    
	sc = conv(s,arr-n);
    sr = conv(s,n);  
end
