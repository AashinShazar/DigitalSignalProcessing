function buttdes(fpass, fstop, dp, ds, fs)

QvalP = log10(10^-(dp/10)-1);
QvalS = log10(10^-(ds/10)-1);

WvalP = (fpass/fs);        
WvalS = (fstop/fs);

WvalPT = tan(WvalP / 2) * 2;
WvalST = tan(WvalS / 2) * 2;

Num = (ceil((QvalS-QvalP) / 2 / log10(WvalST / WvalPT))); 
WvalCT = (10^(-QvalP/2/Num) * WvalPT);

Kval = 0:Num-1;
SKValT =  (exp(1i*pi*(2*Kval+Num+1)/2/Num) * WvalCT);

zplane(real(prod(SKValT./(SKValT -2))) * poly(-ones(1, Num)), real(poly(-(SKValT+2)./(SKValT-2))));

[Hval,Fval]=freqz(real(prod(SKValT./(SKValT -2))) * poly(-ones(1, Num)),real(poly(-(SKValT+2)./(SKValT-2))),fpass,fs);

%Freq vs Resp dB
figure;
semilogx(Fval,(10.*log10(Hval.*conj(Hval))));
xlabel('Frequency (Hz)');
ylabel('Response (dB)');

%Freq vs Resp deg
figure;
semilogx(Fval,(180/pi*angle(Hval)));
xlabel('Frequency (Hz)');
ylabel('Response (deg)');