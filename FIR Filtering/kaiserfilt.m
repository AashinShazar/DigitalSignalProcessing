function h = kaiserfilt(N, wc, beta)
    N = N + 1 - rem(N,2);
	h = (wc*sinc(wc*(((-(N-1)/2):((N-1)/2)))))/sum((wc*sinc(wc*(((-(N-1)/2):((N-1)/2))))));
	h = (h.*((besseli(0, (beta*((1-((2*(((-(N-1)/2):((N-1)/2))))/(N-1)).^2)).^(1/2))))/(besseli(0,beta))))/sum((h.*((besseli(0, (beta*((1-((2*(((-(N-1)/2):((N-1)/2))))/(N-1)).^2)).^(1/2))))/(besseli(0,beta)))));
	stem((h.*((besseli(0, (beta*((1-((2*(((-(N-1)/2):((N-1)/2))))/(N-1)).^2)).^(1/2))))/(besseli(0,beta)))));
end
