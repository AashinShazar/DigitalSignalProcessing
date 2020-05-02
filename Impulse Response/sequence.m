%Aashin Shazar 918371121
%ENGR 451
%Lab 2

classdef sequence
    properties
        data
        offset
    end
    
    methods
        function s = sequence(data, offset)
            % SEQUENCE   Sequence object
            %            S = SEQUENCE(DATA, OFFSET) creates sequence S
            %            using DATA and OFFSET
            %
            %            Aashin Shazar 6 September 2019
            s.data = data;
            s.offset = offset;
        end
        
        function display(s)
            var = inputname(1);
            if (isempty(var))
                disp('ans =');
            else
                disp([var '=']);
            end
            switch length(s.data)
                case 0
                    disp('    data: []')
                case 1
                    disp(['    data: ', num2str(s.data)])
                otherwise
                    disp(['    data: [' num2str(s.data) ']'])
            end
            disp(['  offset: ' num2str(s.offset)])
        end
        
        function x = trim(x)
            while (x.data(1) == 0)
                x.data(1) = [];
                x.offset = x.offset + 1;
            end
            while (x.data(end) == 0)
                x.data(end) = [];
            end
        end
        
        function y = flip(x)
            % FLIP Flip a Matlab sequence structure, x, so y = x[-n]
            LIx = length(x.data) + x.offset - 1;
            y = sequence(flip(x.data), -LIx);
        end
        
        function y = shift(x, n0)
            % SHIFT Shift a Matlab sequence structure, x, by integer amount n0 so that y[n] = x[n - n0]
            y = sequence(x.data, x.offset + n0);
        end
        
        function z = plus(x, y)
            % PLUS  Add x and y. Either x and y will both be sequence structures, or one of them may be a number.
            if isa(x, 'sequence') == 0
                z = sequence(x + y.data, y.offset);
                return;
            elseif isa(y, 'sequence') == 0
                z = sequence(x.data + y, x.offset);
                return;
            else
                LIx = length(x.data) + x.offset - 1;
                LIy = length(y.data) + y.offset - 1;
                Dx = [zeros(1, x.offset - y.offset) x.data zeros(1, LIy - LIx)];
                Dy = [zeros(1, y.offset - x.offset) y.data zeros(1, LIx - LIy)];
                
                Dz = Dx + Dy;
                Oz = min(x.offset, y.offset);
                z = sequence(Dz, Oz);
                z = trim(z);
            end
        end
        
        function z = minus(x, y)
            % MINUS Subtract x and y. Either x and y will both be sequence structures, or one of them may be a number.
            if isa(x, 'sequence') == 0
                z = sequence(x - y.data, y.offset);
                return;
            elseif isa(y, 'sequence') == 0
                z = sequence(x.data - y, x.offset);
                return;
            else
                LIx = length(x.data) + x.offset - 1;
                LIy = length(y.data) + y.offset - 1;
                Dx = [zeros(1, x.offset - y.offset) x.data zeros(1, LIy - LIx)];
                Dy = [zeros(1, y.offset - x.offset) y.data zeros(1, LIx - LIy)];
                
                Dz = Dx - Dy;
                Oz = min(x.offset, y.offset);
                z = sequence(Dz, Oz);
                z = trim(z);
            end
        end
        
        
        function z = times(x, y)
            % TIMES Multiply x and y (i.e. .*) Either x and y will both be sequence structures, or one of them may be a number.
            if isa(x, 'sequence') == 0
                z = sequence(x * y.data, y.offset);
                return;
            elseif isa(y, 'sequence') == 0
                z = sequence(x.data * y, x.offset);
                return;
            else
                LIx = length(x.data) + x.offset - 1;
                LIy = length(y.data) + y.offset - 1;
                Dx = [zeros(1, x.offset - y.offset) x.data zeros(1, LIy - LIx)];
                Dy = [zeros(1, y.offset - x.offset) y.data zeros(1, LIx - LIy)];
                
                Dz = Dx .* Dy;
                Oz = min(x.offset, y.offset);
                z = sequence(Dz, Oz);
                z = trim(z);
            end
        end
        
        function stem(x)
            % STEM Display a Matlab sequence, x, using a stem plot.
            LIx = length(x.data) + x.offset - 1;
            disp(x.offset:LIx);
            stem(x.offset:LIx, x.data);
        end
        
        function y = conv2(x,h)
            %CONV convolve two finite-length Matlab, sequence objects
            %x and h returning sequence object, y
            yo = x.offset + h.offset;
            
            if length(x.data) == length(h.data)
                H = zeros(length(x.data), length(x.data) + length(h.data) -1);
            end
            
            for i=1: length(x.data)
                H(i, i: i+length(h.data) - 1) = h.data;
            end
            
            yd = x.data * H;
            
            y = sequence(yd, yo);
        end
        
        function y = conv(x,h)
            %CONV convolve two finite-length Matlab, sequence objects
            %x and h returning sequence object, y
            Oo = x.offset + h.offset;
            
            x = x.data(:).';
            h = h.data(:).';
            
            Lx = length(x);
            Ly = length(h);
            L  = Lx+Ly-1;
            
            Px = [x zeros(1,L-Lx)];
            Py = [h zeros(1,L-Ly)];
            
            X = fft(Px);
            Y = fft(Py);
            Z = X.*Y;
            z = ifft(Z);
            
            y = sequence(z, Oo);
        end
        
        function y = deconv(x, h)
            Oo = x.offset - h.offset;
            
            x = x.data;
            h = h.data;
            
            Ltotal = length(x)-length(h)+1;
            Lpow = pow2(nextpow2(Ltotal));
            
            X=fft(x, Lpow);
            H=fft(h, Lpow);
            
            Z=X./H;
            x=real(ifft(Z, Lpow));
            x=x(1:1:Ltotal);
            x=x/max(abs(x));
            
            y = sequence(x, Oo);
        end
        
        
        
        
        
        
    end
end
