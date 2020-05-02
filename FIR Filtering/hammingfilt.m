function h = hammingfilt(N, wc)
    N = N + 1 - rem(N,2);
    w = (0.54 + 0.46*cos(((2*pi*(((-(N-1)/2):((N-1)/2))))/(N-1))));
	h = ((wc*sinc(wc*(((-(N-1)/2):((N-1)/2))))).*w)/sum(((wc*sinc(wc*(((-(N-1)/2):((N-1)/2))))).*w));
end