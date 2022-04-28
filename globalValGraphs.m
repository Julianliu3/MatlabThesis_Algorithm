clc;
clear;

titleSize = 20;
axesSize = 20;

[AccArousal1, AccVal1] =  accuracyofGroup(1);
[AccArousal5, AccVal5] =  accuracyofGroup(5);
[AccArousal7, AccVal7] =  accuracyofGroup(7);

AccVal = (AccVal1 + AccVal7)/2;
AccArousal = (AccArousal5 + AccArousal1) / 2;

accCommon1 = accCommon(1);
accCommon7 = accCommon(7);

AccCommon = (accCommon1 + accCommon7)/2;
AccBroke =  (AccVal1 + AccVal7 + AccVal5)/3;

x = linspace(10,40,31);

figure; 
hold on
a0 = plot(x,AccBroke); M0 = "All Valence Points including broken dataset";
a1 = plot(x,AccVal); M1 = "All Valence Points";
a2 = plot(x,AccArousal); M2 = "All Arousal Points";
a3 = plot(x,AccCommon); M3 = "Common Valence Points";
legend([a0,a1,a2,a3], [M0,M1, M2,M3]);


title('Plot of Accuracy VS. maxNum variable');

xlabel('maxNum')
ylabel('Accuracy')


ax = gca;
ax.FontSize = axesSize; 
