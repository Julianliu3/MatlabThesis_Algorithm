clc;
clear;
min = 1;
max = 200;
axesSize = 15;
A = readmatrix('valence\dev_7.csv');

filterLen = 24;
filter = [];
h = filterLen/2;
for i = 1:1:filterLen
    if(i <= h)
        filter(i) = -1;
    else
        filter(i) = 1;
    end
end

x = linspace(0,300,7501);
subplot(2,1,1)
plot(x,A(:,2))
title('Plot of Valence for Anotator 1');

xlabel('Time/s')
ylabel('Valence')

ax = gca;
ax.FontSize = axesSize; 


subplot(2,1,2)
y = conv(filter, A(:,2));
plot(x,y(12:7512))
title('Plot of filtered Valence for Anotator 1');


xlabel('Time/s')
ylabel('Valence')

ax = gca;
ax.FontSize = axesSize; 



