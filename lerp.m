function [interpolatedResult] = lerp(a,b,x)
    interpolatedResult = a + x * (b - a);
end

