function [AccVal] = accCommon(clipNum)    
    clipNumStr = int2str(clipNum);
    A = readmatrix('emotionData.xlsx','Sheet',append('Clip',clipNumStr));
    
    A = round(A);
    ValenceArray1 = [];
    ValenceArray2 = [];
    ValenceArray3 = [];
    ValenceArray4 = [];
    ValenceArray5 = [];
    ArousalArray1= [];
    ArousalArray2= [];
    ArousalArray3= [];
    ArousalArray4= [];
    ArousalArray5= [];
    for x = 1:2:10
        for i = 1:1:length(A(:,x+1))
            if(isnan(A(i,x+1)) == false)
                if(x == 1)
                    ValenceArray1 = [ValenceArray1;A(i,x+1)];
                    ValenceArray1 = [ValenceArray1;A(i,x+1) + 1];
                    ValenceArray1 = [ValenceArray1;A(i,x+1) + 2];
                    ValenceArray1 = [ValenceArray1;A(i,x+1) + 3];
                    ValenceArray1 = [ValenceArray1;A(i,x+1) - 1];
                    ValenceArray1 = [ValenceArray1;A(i,x+1) - 2];
                    ValenceArray1 = [ValenceArray1;A(i,x+1) - 3];
                elseif(x == 3)
                    ValenceArray2 = [ValenceArray2;A(i,x+1)];
                    ValenceArray2 = [ValenceArray2;A(i,x+1) + 1];
                    ValenceArray2 = [ValenceArray2;A(i,x+1) + 2];
                    ValenceArray2 = [ValenceArray2;A(i,x+1) + 3];
                    ValenceArray2 = [ValenceArray2;A(i,x+1) - 1];
                    ValenceArray2 = [ValenceArray2;A(i,x+1) - 2];
                    ValenceArray2 = [ValenceArray2;A(i,x+1) - 3];
                elseif(x == 5)
                    ValenceArray3 = [ValenceArray3;A(i,x+1)];
                    ValenceArray3 = [ValenceArray3;A(i,x+1) + 1];
                    ValenceArray3 = [ValenceArray3;A(i,x+1) + 2];
                    ValenceArray3 = [ValenceArray3;A(i,x+1) + 3];
                    ValenceArray3 = [ValenceArray3;A(i,x+1) - 1];
                    ValenceArray3 = [ValenceArray3;A(i,x+1) - 2];
                    ValenceArray3 = [ValenceArray3;A(i,x+1) - 3];
                elseif(x == 7)
                    ValenceArray4 = [ValenceArray4;A(i,x+1)];
                    ValenceArray4 = [ValenceArray4;A(i,x+1) + 1];
                    ValenceArray4 = [ValenceArray4;A(i,x+1) + 2];
                    ValenceArray4 = [ValenceArray4;A(i,x+1) + 3];
                    ValenceArray4 = [ValenceArray4;A(i,x+1) - 1];
                    ValenceArray4 = [ValenceArray4;A(i,x+1) - 2];
                    ValenceArray4 = [ValenceArray4;A(i,x+1) - 3];
                elseif(x == 9)
                    ValenceArray5 = [ValenceArray5;A(i,x+1)];
                    ValenceArray5 = [ValenceArray5;A(i,x+1) + 1];
                    ValenceArray5 = [ValenceArray5;A(i,x+1) + 2];
                    ValenceArray5 = [ValenceArray5;A(i,x+1) + 3];
                    ValenceArray5 = [ValenceArray5;A(i,x+1) - 1];
                    ValenceArray5 = [ValenceArray5;A(i,x+1) - 2];
                    ValenceArray5 = [ValenceArray5;A(i,x+1) - 3];
                end

            end
        end
    end

    finalArray = intersect(intersect(intersect(ValenceArray1,ValenceArray2),intersect(ValenceArray3,ValenceArray4)),ValenceArray5);
    returnArray = [];
    temp = [];
    temp(1) = finalArray(1);
    for i = 2:1:length(finalArray)
        if(abs(finalArray(i-1) - finalArray(i)) < 3)
            temp = [temp;finalArray(i)];
        else 
            returnArray = [returnArray; mean(temp)];
            temp = [];
            temp = [temp;finalArray(i)];
        end
    end

    returnArray = [returnArray;mean(temp)];
    ValenceArray = round(returnArray);
    AccVal = [];
    for val = 10:1:40
        LMVal = landMarkfunc('valence', clipNum,val);
        LMVal = sort(LMVal)
        scoreVal = 0;
        scoreVal1 = 0;
        for i = 1:1:length(ValenceArray)
            if(ismember(ValenceArray(i) + 2,LMVal))
                scoreVal = scoreVal + 1;
            end
        end
        set = 0;
        for i = 2:1:length(LMVal)
            if(abs(LMVal(i-1) - LMVal(i)) > 2)
                set = 0;
            end
            if(ismember(LMVal(i) -2, ValenceArray))
                if(set == 0)
                    set = 1;
                    scoreVal1 = scoreVal1 + 1;
                end
            end
        end
        AccVal = [AccVal; ((scoreVal)/(length(ValenceArray)) + scoreVal1/lenOfFunc(LMVal))/2];
    end

    


       