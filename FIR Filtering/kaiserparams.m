function [N,beta] = kaiserparams(deltaOmega, delta)
	A= -20*log10(delta);      
    if A>50                   
    	beta = .1102*(A- 8.7);
    elseif A<=50 && A>=21
    	beta = ((.07886*(A-21)) + (.5842*((A-21))^.4));
	else
    	beta = 0;
    end
	N = ceil(((A-8)/(2.285*deltaOmega*pi))); 
	if (rem(N,2))==0
    	N=N+1;
	end
end