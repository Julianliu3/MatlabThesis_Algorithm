clc;
clear;
ValenceArray = [];
ArousalArray = [];
for val = 10:5:30
    tempVal = zeros(1,300);
    tempArousal = zeros(1,300);
    LMVal = landMarkfunc('valence', 5,val);
    LMArousal = landMarkfunc('arousal', 5,val);
    for i = 1:1:300
        if(ismember(i,LMVal))
            tempVal(i) = 1;
        else
            tempVal(i) = 0;
        end
        if(ismember(i,LMArousal))
            tempArousal(i) = 1;
        else
            tempArousal(i) = 0;
        end
    end
    ValenceArray = [ValenceArray;tempVal];
    ArousalArray = [ArousalArray;tempArousal];
end

x = linspace(1,300,300);

subplot(5,2,1)
plot(x,ArousalArray(1,:))
title('Arousal for maxNum = 10')

subplot(5,2,2)
plot(x,ValenceArray(1,:))
title('Valence for maxNum = 10')


subplot(5,2,3)
plot(x,ArousalArray(2,:))
title('Arousal for maxNum = 15')

subplot(5,2,4)
plot(x,ValenceArray(2,:))
title('Valence for maxNum = 15')


subplot(5,2,5)
plot(x,ArousalArray(3,:))
title('Arousal for maxNum = 20')

subplot(5,2,6)
plot(x,ValenceArray(3,:))
title('Valence for maxNum = 20')


subplot(5,2,7)
plot(x,ArousalArray(4,:))
title('Arousal for maxNum = 25')

subplot(5,2,8)
plot(x,ValenceArray(4,:))
title('Valence for maxNum = 25')

subplot(5,2,9)
plot(x,ArousalArray(5,:))
title('Arousal for maxNum = 30')

subplot(5,2,10)
plot(x,ValenceArray(5,:))
title('Valence for maxNum = 30')

