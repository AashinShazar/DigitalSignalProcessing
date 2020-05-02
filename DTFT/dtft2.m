function y = dtft2(x,w)
lengthVal = x.offset:(x.offset+length(x.data) -1);
Freal = cos(lengthVal'*w);
Fim = -sin(lengthVal'*w);
y.real = x.data * Freal;
y.imag = x.data * Fim;
end 