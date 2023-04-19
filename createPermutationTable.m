function [outnum] = createPermutationTable(length)
    % This function creates a permutation table for use in a hash function
    % later on in a different function
    outnum = [];
    nums = 1:floor(length);
    sizeNums = size(nums,2);
    
    % Iterate through all numbers
    while sizeNums>0
        choose = ceil(sizeNums*rand);
        
        outnum = [outnum,nums(choose)];
        nums(choose) = [];
        
        sizeNums = size(nums,2);
    end
end

