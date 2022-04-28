function [AccArousal, AccVal] = accuracyofGroup(clipNum)

    clipNumStr = int2str(clipNum);
    A = readmatrix('emotionData.xlsx','Sheet',append('Clip',clipNumStr));
    
    A = round(A);
    ValenceArray = [];
    ArousalArray= [];
    for x = 1:2:10
        for i = 1:1:length(A(:,x+1))
            if(isnan(A(i,x+1)) == false)
                ValenceArray = [ValenceArray;A(i,x+1)];
            end
        end
        for i = 1:1:length(A(:,x))
            if(isnan(A(i,x+1)) == false)
                ArousalArray = [ArousalArray;A(i,x)];
            end
        end
       
    end
    
    AccVal = [];
    AccArousal = [];
    for val = 10:1:40
        LMVal = landMarkfunc('valence', clipNum,val);
        LMArousal = landMarkfunc('arousal', clipNum,val);
        LMVal = sort(LMVal);
        LMArousal = sort(LMArousal);
        scoreVal = 0;
        scoreArr = 0;
        scoreVal1 = 0;
        scoreArr1 = 0;
        for i = 1:1:length(ValenceArray)
            if(ismember(ValenceArray(i) + 2,LMVal))
                scoreVal = scoreVal + 1;
            end
            if(ismember(ArousalArray(i) + 2,LMArousal))
                scoreArr = scoreArr + 1;
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
        set = 0;
        for i = 2:1:length(LMArousal)
            if(abs(LMArousal(i-1) - LMArousal(i)) > 2)
                set = 0;
            end
            if(ismember(LMArousal(i) -2, ArousalArray))
                if(set == 0)
                    set = 1;
                    scoreArr1 = scoreArr1 + 1;
                end
            end
        end

        AccVal = [AccVal; ((scoreVal)/(length(ValenceArray)) + scoreVal1/lenOfFunc(LMVal))/2];
        AccArousal = [AccArousal; ((scoreVal)/(length(ArousalArray)) + scoreArr1/lenOfFunc(LMArousal))/2];
    end
    

