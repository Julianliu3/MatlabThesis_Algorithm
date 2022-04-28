clc;
clear;
min = 1;
max = 200;
A = readmatrix('arousal\dev_7.csv');
time = A(:,1);
Rator1 = A(:,2);
Rator2 = A(:,3);
Rator3 = A(:,4);
Rator4 = A(:,5);
Rator5 = A(:,6);
Rator6 = A(:,7);
landMark1 = [];
landMark2 = [];
landMark3 = [];
landMark4 = [];
landMark5 = [];
landMark6 = [];

landMark1V = [];
landMark2V = [];
landMark3V = [];
landMark4V = [];
landMark5V = [];
landMark6V = [];
filterLen = 4;


while((length(landMark1) < min || length(landMark1) > max)&&filterLen < 50)
    landMark1 = [];
    landMark1V = [];
    filter = [];
    h = filterLen/2;
    for i = 1:1:filterLen
        if(i <= h)
            filter(i) = -1;
        else
            filter(i) = 1;
        end
    end
    LMs1 = abs(conv(filter, Rator1));
    for i = 2:1:7500
        if(LMs1(i-1) < LMs1(i) && LMs1(i+1) < LMs1(i))
            landMark1 = [landMark1; time(i)];
            landMark1V = [landMark1V; LMs1(i)];
        end
    end
    filterLen = filterLen + 2;
    if filterLen > 200
        break;
    end
end

filterLen = 4;
while((length(landMark2) < min || length(landMark2) > max)&&filterLen < 50)

    landMark2 = [];
    landMark2V = [];
    filter = [];
    h = filterLen/2;
    for i = 1:1:filterLen
        if(i <= h)
            filter(i) = -1;
        else
            filter(i) = 1;
        end
    end
    LMs2 = abs(conv(filter, Rator2));
    for i = 2:1:7500
        if(LMs2(i-1) < LMs2(i) && LMs2(i+1) < LMs2(i))
            landMark2 = [landMark2; time(i)];
            landMark2V = [landMark2V; LMs2(i)];
        end
    end
    filterLen = filterLen + 2;
    if filterLen > 200
        break;
    end
end
filterLen = 4;
while((length(landMark3) < min || length(landMark3) > max)&&filterLen < 50)
    landMark3 = [];
    landMark3V = [];
    filter = zeros(filterLen,1);
    h = filterLen/2;
    for i = 1:1:length(filter)
        if(i <= h)
            filter(i) = -1;
        else
            filter(i) = 1;
        end
    end
    LMs3 = abs(conv(filter, Rator3));
    for i = 2:1:7500
        if(LMs3(i-1) < LMs3(i) && LMs3(i+1) < LMs3(i))
            landMark3 = [landMark3; time(i)];
            landMark3V = [landMark3V; LMs3(i)];
        end
    end
    filterLen = filterLen + 2;
end

filterLen = 4;
while((length(landMark4) < min || length(landMark4) > max)&&filterLen < 50)
    landMark4 = [];
    landMark4V = [];
    filter = zeros(filterLen,1);
    h = filterLen/2;
    for i = 1:1:length(filter)
        if(i <= h)
            filter(i) = -1;
        else
            filter(i) = 1;
        end
    end
    LMs4 = abs(conv(filter, Rator4));
    for i = 2:1:7500
        if(LMs4(i-1) < LMs4(i) && LMs4(i+1) < LMs4(i))
            landMark4 = [landMark4; time(i)];
            landMark4V = [landMark4V; LMs4(i)];
        end
    end
    filterLen = filterLen + 2;
    if filterLen > 200
        break;
    end
end
filterLen = 4;
while((length(landMark5) < min || length(landMark5) > max)&&filterLen < 50)
    landMark5 = [];
    landMark5V = [];
    filter = zeros(filterLen,1);
    h = filterLen/2;
    for i = 1:1:length(filter)
        if(i <= h)
            filter(i) = -1;
        else
            filter(i) = 1;
        end
    end
    LMs5 = abs(conv(filter, Rator5));
    for i = 2:1:7500
        if(LMs5(i-1) < LMs5(i) && LMs5(i+1) < LMs5(i))
            landMark5 = [landMark5; time(i)];
            landMark5V = [landMark5V; LMs5(i)];
        end
    end
    filterLen = filterLen + 2;
    if filterLen > 200
        break;
    end
end
filterLen = 4;
while((length(landMark6) < min || length(landMark6) > max)&&filterLen < 50)
    landMark6 = [];
    landMark6V = [];
    filter = zeros(filterLen,1);
    h = filterLen/2;
    for i = 1:1:length(filter)
        if(i <= h)
            filter(i) = -1;
        else
            filter(i) = 1;
        end
    end
    LMs6 = abs(conv(filter, Rator6));
    for i = 2:1:7500
        if(LMs6(i-1) < LMs6(i) && LMs6(i+1) < LMs6(i))
            landMark6 = [landMark6; time(i)];
            landMark6V = [landMark6V; LMs6(i)];
        end
    end
    filterLen = filterLen + 2;
    if filterLen > 200
        break;
    end
end
    numMax = 3;
  
    landMarkTop_1 = [];
    landMarkTop_2 = [];
    landMarkTop_3 = [];
    landMarkTop_4 = [];
    landMarkTop_5 = [];
    landMarkTop_6 = [];
    maxElems = maxk(landMark1V,numMax);
    for i = 1:1:length(maxElems)
        s = find(landMark1V == maxElems(i))
        for j = -5:1:5
            landMarkTop_1 = [landMarkTop_1;round(landMark1(s)) + j];
        end
        
    end
    
    maxElems = maxk(landMark2V,numMax);
    for i = 1:1:length(maxElems)
        s = find(landMark2V == maxElems(i))
        for j = -5:1:5
            landMarkTop_2 = [landMarkTop_2;round(landMark2(s)) + j];
        end
    end
    
    maxElems = maxk(landMark3V,numMax);
    for i = 1:1:length(maxElems)
        s = find(landMark3V == maxElems(i))
        for j = -5:1:5
            landMarkTop_3 = [landMarkTop_3;round(landMark3(s)) + j];
        end
    end
    
    maxElems = maxk(landMark4V,numMax);
    for i = 1:1:length(maxElems)
        s = find(landMark4V == maxElems(i))
        for j = -5:1:5
            landMarkTop_4 = [landMarkTop_4;round(landMark4(s))+ j];
        end
    end
    
    maxElems = maxk(landMark5V,numMax);
    for i = 1:1:length(maxElems)
        s = find(landMark5V == maxElems(i))
        for j = -5:1:5
            landMarkTop_5 = [landMarkTop_5;round(landMark5(s)) + j];
        end
    end
    
    maxElems = maxk(landMark6V,numMax);
    for i = 1:1:length(maxElems)
        s = find(landMark6V == maxElems(i))
        for j = -5:1:5
            landMarkTop_6 = [landMarkTop_6;round(landMark6(s)) + j];
        end
    end

