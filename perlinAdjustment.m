function outArray = perlinAdjustment(inArray)
    % Adjusts the output of the perlin noise
    %base
%     outArray = inArray;
    %EnhanceShadows
%     outArray = inArray.^2;
    % Reduce Contrast
%     outArray = (sign(inArray*2-1).*(inArray*2-1).^2+1)/2;
    %IncreaseContrast
    outArray = (sign(inArray*2-1).*(abs(inArray*2-1)).^(0.8)+1)/2;

end