function ph = magdb(h) 
	ph = plot((linspace(0,pi*2,1024)) / pi,(log10((abs((fft(h, 1024)))))*20));
    xlim([0 1]);
    set(ph, 'LINEWIDTH', 3, 'COLOR', 'R');
end
