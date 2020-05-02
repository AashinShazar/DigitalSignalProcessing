function y = dtft(x,w)
lengthVal = x.offset:(x.offset+length(x.data) -1);
func = exp(-1j * lengthVal' * w);
y = (x.data * func);
end