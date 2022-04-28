clc;
clear;
A = readmatrix('emotionData.xlsx','Sheet','Clip1');

titleSize = 15;
axesSize = 15;

A = round(A);
ValenceArray = [];
ArousalArray = [];
for x = 1:2:10
    tempVal = zeros(1,300);
    tempArousal = zeros(1,300);
    for i = 1:1:300
        if(ismember(i,A(:,x+1)))
            tempVal(i) = 1;
        else
            tempVal(i) = 0;
        end
        if(ismember(i,A(:,x)))
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
title('Rator 1: Change in Arousal', 'FontSize',titleSize);
xlabel('time/s' ,'FontSize', axesSize);

ax = gca;
ax.FontSize = axesSize; 

subplot(5,2,2)
plot(x,ValenceArray(1,:))
title('Rator 1: Change in Valence','FontSize', titleSize);
xlabel('time/s','FontSize', axesSize);

ax = gca;
ax.FontSize = axesSize; 

subplot(5,2,3)
plot(x,ArousalArray(2,:))
title('Rator 2: Change in Arousal','FontSize', titleSize);
xlabel('time/s','FontSize', axesSize);

ax = gca;
ax.FontSize = axesSize; 

subplot(5,2,4)
plot(x,ValenceArray(2,:))
title('Rator 2: Change in Valence','FontSize', titleSize);
xlabel('time/s','FontSize', axesSize);

ax = gca;
ax.FontSize = axesSize; 

subplot(5,2,5)
plot(x,ArousalArray(3,:))
title('Rator 3: Change in Arousal','FontSize', titleSize);
xlabel('time/s','FontSize', axesSize);

ax = gca;
ax.FontSize = axesSize; 

subplot(5,2,6)
plot(x,ValenceArray(3,:))
title('Rator 3: Change in Valence','FontSize', titleSize);
xlabel('time/s','FontSize', axesSize);

ax = gca;
ax.FontSize = axesSize; 

subplot(5,2,7)
plot(x,ArousalArray(4,:))
title('Rator 4: Change in Arousal','FontSize', titleSize);
xlabel('time/s','FontSize', axesSize);

ax = gca;
ax.FontSize = axesSize; 

subplot(5,2,8)
plot(x,ValenceArray(4,:))
title('Rator 4: Change in Valence','FontSize', titleSize);
xlabel('time/s','FontSize', axesSize);

ax = gca;
ax.FontSize = axesSize; 

subplot(5,2,9)
plot(x,ArousalArray(5,:))
title('Rator 5: Change in Arousal','FontSize', titleSize);
xlabel('time/s','FontSize', axesSize);

ax = gca;
ax.FontSize = axesSize; 

subplot(5,2,10)
plot(x,ValenceArray(5,:))
title('Rator 5: Change in Valence','FontSize', titleSize);
xlabel('time/s','FontSize', axesSize);

ax = gca;
ax.FontSize = axesSize; 
