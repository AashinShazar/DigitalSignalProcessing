function h = rectfilt(N, wc)
    N = N + 1 - rem(N,2);
	h = (wc*sinc(wc*(((-(N-1)/2):((N-1)/2)))))/sum((wc*sinc(wc*(((-(N-1)/2):((N-1)/2))))));
end
