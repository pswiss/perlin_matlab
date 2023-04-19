function [gradVal] = grad(hash,x,y,z)
    % Choose a dot product val according to the hash value
    gradVal = [...
        x + y,...
        -x + y,...
        x - y,...
        -x - y,...
        x + z,...
        -x + z,...
        x - z,...
        -x - z,...
        y + z,...
        -y + z,...
        y - z,...
        -y - z,...
        y + x,...
        -y + z,...
        y - x,...
        -y - z];
                
    gradVal = gradVal(mod(hash,15)+1);

end

