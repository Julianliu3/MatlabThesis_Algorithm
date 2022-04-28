function [count] = lenOfFunc(ListA)   

    List1 = sort(ListA);
    count = 1;
    
    for i = 2:1:length(List1)
        if(abs(List1(i-1) - List1(i)) > 2)
            count = count + 1;
        end
    end

    if(isempty(List1))
        count = 0;
    end