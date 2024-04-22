function [hash] = AvgHash(imagearray)
% AvgHash uses the Average Hashing algorithm to obtain the hash of a 
% greyscale image.
% Input:
%     imagearray: an m-by-n uint8 array representing a greyscale image.
% Output:
%     hash: a 1-by-mn logical row vector representing the average hash of 
%     the greyscale image.
% Author: Andrew Jin

% Calculating average pixel value
doublearray = double(imagearray);
avg = mean(mean(doublearray));
avg = round(avg);

% Comparing each pixel value with average pixel value
[rows,cols] = size(imagearray);
hash = zeros(1,rows * cols,"logical");
a = 1;
for i = 1:rows
    for j = 1:cols
        if imagearray(i,j) >= avg
            hash(a) = true;
        else
            hash(a) = false;
        end
        a = a + 1;
    end
end
end