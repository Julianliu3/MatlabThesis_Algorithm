clc;
clear;
A = readmatrix('emotionData.xlsx','Sheet','Clip1');

titleSize = 20;
axesSize = 15;

ratorNum = 2;
A = round(A);
ValenceArrayRator = [];
ArousalArrayRator = [];
for x = 1:2:10
    tempVal = zeros(1,300);
    tempArousal = zeros(1,300);
    for i = 2:1:298
        if(ismember(i,A(:,x+1)))
            tempVal(i+2) = 1;
        else 
            tempVal(i+2) = 0; 
        end
        if(ismember(i,A(:,x)))
            tempArousal(i+2) = 1;
        else
            tempArousal(i+2) = 0;
        end
    end
    ValenceArrayRator = [ValenceArrayRator;tempVal];
    ArousalArrayRator = [ArousalArrayRator;tempArousal];
end

ValenceArray = [];
ArousalArray = [];
for val = 10:5:30
    tempVal = zeros(1,300);
    tempArousal = zeros(1,300);
    LMVal = landMarkfunc('valence', 1,val);
    LMArousal = landMarkfunc('arousal', 1,val);
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
a0 = plot(x,ArousalArray(1,:));
title('Arousal for maxNum = 10');

ylim([0 1.2])

ax = gca;
ax.FontSize = axesSize; 

hold on 

a1 = plot(x,ArousalArrayRator(ratorNum,:));
M0 = "Algorithm";
M1 = "System";
legend([a0,a1], [M0, M1]);


subplot(5,2,2)
a0 = plot(x,ValenceArray(1,:));
title('Valence for maxNum = 10');

ylim([0 1.2])

ax = gca;
ax.FontSize = axesSize; 

hold on 

a1 = plot(x,ValenceArrayRator(ratorNum,:));

M0 = "Algorithm";
M1 = "System";
legend([a0,a1], [M0, M1]);


subplot(5,2,3)
a0 = plot(x,ArousalArray(2,:));
title('Arousal for maxNum = 15');

ylim([0 1.2])

ax = gca;
ax.FontSize = axesSize; 

hold on 

a1 = plot(x,ArousalArrayRator(ratorNum,:));

M0 = "Algorithm";
M1 = "System";
legend([a0,a1], [M0, M1]);

subplot(5,2,4)
a0 = plot(x,ValenceArray(2,:));
title('Valence for maxNum = 15');

ylim([0 1.2])

ax = gca;
ax.FontSize = axesSize; 

hold on 

a1 = plot(x,ValenceArrayRator(ratorNum,:));

M0 = "Algorithm";
M1 = "System";
legend([a0,a1], [M0, M1]);

subplot(5,2,5)
a0 = plot(x,ArousalArray(3,:))
title('Arousal for maxNum = 20');

ylim([0 1.2])

ax = gca;
ax.FontSize = axesSize; 

hold on 

a1 = plot(x,ArousalArrayRator(ratorNum,:));

M0 = "Algorithm";
M1 = "System";
legend([a0,a1], [M0, M1]);

subplot(5,2,6)
a0 = plot(x,ValenceArray(3,:));
title('Valence for maxNum = 20');

ylim([0 1.2])

ax = gca;
ax.FontSize = axesSize; 

hold on 

a1 = plot(x,ValenceArrayRator(ratorNum,:));

M0 = "Algorithm";
M1 = "System";
legend([a0,a1], [M0, M1]);


subplot(5,2,7)
a0 = plot(x,ArousalArray(4,:));
title('Arousal for maxNum = 25');

ylim([0 1.2])

ax = gca;
ax.FontSize = axesSize; 

hold on 

a1 = plot(x,ArousalArrayRator(ratorNum,:));

M0 = "Algorithm";
M1 = "System";
legend([a0,a1], [M0, M1]);

subplot(5,2,8)
a0 = plot(x,ValenceArray(4,:));
title('Valence for maxNum = 25');

ylim([0 1.2])

ax = gca;
ax.FontSize = axesSize; 

hold on 

a1 = plot(x,ValenceArrayRator(ratorNum,:));

M0 = "Algorithm";
M1 = "System";
legend([a0,a1], [M0, M1]);

subplot(5,2,9)
a0 = plot(x,ArousalArray(5,:));
title('Arousal for maxNum = 30');

ylim([0 1.2])

ax = gca;
ax.FontSize = axesSize; 

hold on 

a1 = plot(x,ArousalArrayRator(ratorNum,:));
M0 = "Algorithm";
M1 = "System";
legend([a0,a1], [M0, M1]);

subplot(5,2,10)
a0 = plot(x,ValenceArray(5,:));
title('Valence for maxNum = 30');

ylim([0 1.2])

ax = gca;
ax.FontSize = axesSize; 

hold on 

a1 = plot(x,ValenceArrayRator(ratorNum,:));

M0 = "Algorithm";
M1 = "System";
legend([a0,a1], [M0, M1]);

