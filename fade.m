function fadedNumber = fade(n)
    % This is the standard fade function used 
    % in implementations of Perlin noise
    fadedNumber = 6*(n.^5) - 15*(n.^4) + 10*(n.^3);
end

