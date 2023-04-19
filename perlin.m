function pointVal = perlin(x,y,z,repeat,permutationTable)
    % Generate a 3D noise map based on Ken Perlin's 'Improved Perlin Noise'
    % algorithm. This implementation was created using the article at the
    % following location: http://flafla2.github.io/2014/08/09/perlinnoise.html
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Constants
    edgeCoordinates = [[1,1,0];[-1,1,0];[1,-1,0];[-1,-1,0];[1,0,1];[-1,0,1];[1,0,-1];[-1,0,-1];[0,1,1];[0,-1,1];[0,1,-1];[0,-1,-1]];
    sizePerTable = max(size(permutationTable));
    % If the perlin noise is meant to repeat, bring xyz to within the
    % repeat boudaries
    x = mod(x,repeat);
    y = mod(y,repeat);
    z = mod(z,repeat);
    
    % Find unit cube base dimensions
    xi = floor(x);
    yi = floor(y);
    zi = floor(z);
    
    % Find location of the point within its unit cube
    [xf] = mod([x],1);
    [yf] = mod([y],1);
    [zf] = mod([z],1);
    % Find faded versions of this point
    u = fade(xf);
    v = fade(yf);
    w = fade(zf);
    
    % get hashed numbers for the edges
    hashes = hash(xi,yi,zi,permutationTable, sizePerTable,repeat);
    aaa = hashes(1);
    aba = hashes(2);
    aab = hashes(3);
    abb = hashes(4);
    baa = hashes(5);
    bba = hashes(6);
    bab = hashes(7);
    bbb = hashes(8);
    
    % Final Step
    x1 = lerp(grad(aaa,xf,yf,zf),grad(baa,xf-1,yf,zf),u);
    x2 = lerp(grad(aba,xf,yf-1,zf),grad(bba,xf-1,yf-1,zf),u);
    y1 = lerp(x1,x2,v);
    x1 = lerp(grad(aab,xf,yf,zf-1),grad(bab,xf-1,yf,zf-1),u);
    x2 = lerp(grad(abb,xf,yf-1,zf-1),grad(bbb,xf-1,yf-1,zf-1),u);
    y2 = lerp(x1,x2,v);
    
    pointVal = (lerp(y1,y2,w)+1)/2;

end

