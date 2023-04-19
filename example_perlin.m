clear all; close all;clc
profile off
profile on
% Create Perlin Noise
x = 10; y=10;z=1;
permutationTable = createPermutationTable(2^(max([x,y,z])+3));
repeat = 0;
perlinNoiseTable = [];
rez = 0.05;
% Cannot loop from 1 since this causes matlab indexing issues
tic
for ii = (1/rez):(x/rez)
    for jj = (1/rez):(y/rez)
        perlinNoiseTable(ii,jj) =...
            attenuateOutput(perlin(ii*rez,jj*rez,0,0,permutationTable), 0.1, 5);
    end
% %     if mod(ii,25)==0
% %         timeElapsed = toc;
% %         completionTime = timeElapsed/((ii-(1/rez))/(x/rez));
% %         timeRemain = completionTime - timeElapsed;
% %         hrs = (timeRemain-mod(timeRemain,60*60))/(60*60); timeRemain = timeRemain - hrs*60*60;
% %         mins = (timeRemain-mod(timeRemain,60))/60; timeRemain = timeRemain - mins*60;
% %         secs = timeRemain - mod(timeRemain,.05);
% %         
% %         fprintf('%d of %d complete. \tTime Remaining: %d:%2d:%2.2f\r\n',ii-(1/rez),x/rez,hrs,mins,secs)
% %     end
end
% Strip off blank regions
perlinNoiseTable([1:1/rez-1],:) = [];
perlinNoiseTable(:,[1:1/rez-1]) = [];

profile viewer
profile off

I = mat2gray(perlinNoiseTable,[0,1]);
figure
imshow(I)