function str = dtmfdecode(s,fs)

    placeHold = [];
     
    modSig = s(1:end-rem(length(s),12));
    sigLength = length(modSig)/12;
    plot(s);
   
    phoneTones = ['1','2','3';
                  '4','5','6';
                  '7','8','9';
                  '*','0','#'];

    timeCheck = .05;
    t = (.04:1/fs:timeCheck);

    for i = 0:11
        eachFilter = modSig(i*sigLength+1:i*sigLength+sigLength);

        y1 = sum(conv(cos(2*pi*t*670),eachFilter).^2);
        y2 = sum(conv(cos(2*pi*t*770),eachFilter).^2);
        y3 = sum(conv(cos(2*pi*t*850),eachFilter).^2);
        y4 = sum(conv(cos(2*pi*t*950),eachFilter).^2);
        y5 = sum(conv(cos(2*pi*t*1200),eachFilter).^2);
        y6 = sum(conv(cos(2*pi*t*1330),eachFilter).^2);
        y7 = sum(conv(cos(2*pi*t*1440),eachFilter).^2);
        
        [~,colVal] = max([y5, y6, y7]);
        [~,rowVal] = max([y1, y2, y3, y4]);
        
        
        placeHold = [placeHold,phoneTones(rowVal,colVal)];
        
    end

    str = [placeHold ''];

end