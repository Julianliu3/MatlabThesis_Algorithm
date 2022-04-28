clc;
clear;

axesSize = 20;

ValenceList = [];
ArousalList = [];
for val = 1:1:40
    valCount = 0;
    ArCount = 0;
    for clipNum = 1:1:9
        LMVal = landMarkfunc('valence', clipNum,val);
        LMArousal = landMarkfunc('arousal', clipNum,val);
        valCount = valCount + lenOfFunc(LMVal);
        arCount = ArCount + lenOfFunc(LMArousal);
    end
    ValenceList = [ValenceList;valCount/9];
    ArousalList = [ArousalList;arCount/9];
end

x = linspace(1,40,40);
figure; 
hold on

a0 = plot(x,ValenceList); M0 = "Valence";
a1 = plot(x,ArousalList); M1 = "Arousal";

legend([a0,a1], [M0,M1]);

title('Plot of Number of Salient Points VS. maxNum Variable');

ax = gca;
ax.FontSize = axesSize; 

xlabel('maxNum')
ylabel('Average number of Salient points')