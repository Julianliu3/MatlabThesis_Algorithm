clc;
clear;
A = readmatrix('emotionData.xlsx','Sheet','Clip5');

ratorNum = 5;
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

x = linspace(1,300,300);

