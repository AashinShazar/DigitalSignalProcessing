function fplot(b, a)

if isempty(a)
a = 1;
end
H = fft(b,512)./(fft(a,512)+eps);
Hang = zeros(1,512);

for i = 1:512
if imag(H(i)) > 0
    Hang(i) = angle(H(i))/pi;

else
    Hang(i) = -(angle(H(i))/pi);
end

end



subplot(2,1,2)
plot(((linspace(0,2*pi,512))./pi),Hang,'LINEWIDTH',1)
xlim([0 1]);
xticks(0:0.25:1);
ylim([-1 1]);
ylabel('\angleH(\omega) (rad/\pi)')
xlabel('\omega (rad/\pi)')


subplot(2,1,1)
plot(((linspace(0,2*pi,512))./pi),abs(H),'LINEWIDTH',1)
xlim([0 1]);
ylim([0 inf]);
ylabel('|H(\omega)|')
xticks(0:0.25:1);

end