function [dhash] = DiffHash(imgarray)
% DiffHash uses the Differential Hashing algorithm to obtain the hash of a 
% greyscale image.
% Input:
%     imgarray: an m-by-(n+1) uint8 array representing a greyscale image.
% Output:
%     dhash: a 1-by-mn logical row vector representing the differential hash 
%     of the greyscale image.
% Author: Andrew Jin

% Establishing variables
[rows,cols] = size(imgarray);
dhash = zeros(1,rows * (cols - 1),"logical");
a = 1;

% Comparing each pixel in image and creating hash
for i = 1:rows
    for j = 1:cols - 1
        if imgarray(i,j) >= imgarray(i,j + 1)
            dhash(a) = true;
        else
            dhash(a) = false;
        end
        a = a + 1;
    end
end
end