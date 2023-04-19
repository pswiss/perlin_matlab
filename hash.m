function [hashes] = hash(xi,yi,zi,p,size_p,repeat)
    xipp = inc(repeat,xi);
    yipp = inc(repeat,yi);
    zipp = inc(repeat,zi);
    %Hash function for perlin noise
    try
        hashes(1) = p(max(1,mod(p(max(1,mod(p(  xi)+    yi,size_p)))+   zi,size_p)));
        hashes(2) = p(max(1,mod(p(max(1,mod(p(  xi)+  yipp,size_p)))+   zi,size_p)));
        hashes(3) = p(max(1,mod(p(max(1,mod(p(  xi)+    yi,size_p)))+ zipp,size_p)));
        hashes(4) = p(max(1,mod(p(max(1,mod(p(  xi)+  yipp,size_p)))+ zipp,size_p)));
        hashes(5) = p(max(1,mod(p(max(1,mod(p(xipp)+    yi,size_p)))+   zi,size_p)));
        hashes(6) = p(max(1,mod(p(max(1,mod(p(xipp)+  yipp,size_p)))+   zi,size_p)));
        hashes(7) = p(max(1,mod(p(max(1,mod(p(xipp)+    yi,size_p)))+ zipp,size_p)));
        hashes(8) = p(max(1,mod(p(max(1,mod(p(xipp)+  yipp,size_p)))+ zipp,size_p)));
    catch
        aa = 1;
    end
end

