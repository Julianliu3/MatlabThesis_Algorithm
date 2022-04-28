clc;
clear;
min = 1;
max = 200;
axesSize = 15;
A = readmatrix('valence\dev_7.csv');


x = linspace(0,300,7501);
subplot(2,1,1)
plot(x,A(:,2))
title('Plot of Valence for Anotator 1');

xlabel('Time/s')
ylabel('Valence')

ax = gca;
ax.FontSize = axesSize; 


subplot(2,1,2)
plot(x, A(:,3))
title('Plot of Valence for Anotator 2');


xlabel('Time/s')
ylabel('Valence')

ax = gca;
ax.FontSize = axesSize; 