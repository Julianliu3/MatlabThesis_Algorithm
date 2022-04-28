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
        scoreVal = 0;
        scoreArr = 0;
        for i = 1:1:length(ValenceArray)
            if(ismember(ValenceArray(i) + 2,LMVal))
                scoreVal = scoreVal + 1;
            end
            if(ismember(ArousalArray(i) + 2,LMArousal))
                scoreArr = scoreArr + 1;
            end
        end
        AccVal = [AccVal; (scoreVal/length(ValenceArray))];
        AccArousal = [AccArousal; (scoreArr/length(AccArousal))];
    end
    

