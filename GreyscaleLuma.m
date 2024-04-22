function [greyscale] = GreyscaleLuma(rgb)
% GreyscaleLuma converts an RGB colour image to a greyscale image by 
% calculating a weighted sum for each pixel. 
% Input:
%     rgb: a m-by-n-by-3 uint8 array representing an RGB colour image.
% Output:
%     greyscale: a m-by-n-by-1 uint8 array representing a greyscale 
%     image.
% Author: Andrew Jin

% Establishing variables
rows = height(rgb);
cols = width(rgb);

% Creating greyscale image
greyscale = zeros(rows,cols,"uint8");
for i = 1:rows
    for j = 1:cols
        % Calculating weighted sum for each pixel
        sum = 0.2126 * double(rgb(i,j,1)) + 0.7152 * double(rgb(i,j,2))...
            + 0.0722 * double(rgb(i,j,3));
        sum = uint8(round(sum));
        greyscale(i,j) = sum;
    end
end
end