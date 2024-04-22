function [resizedimage] = ResizeNearest(inputimage, resize)
% ResizeNearest resizes an image using the Nearest Neighbour Interpolation
% algorithm.
% Inputs:
%     inputimage: a uint8 array representing a greyscale or RGB image.
%     resize: a 1-by-2 double array representing the desired height and 
%     width of the resized image respectively.
% Output:
%     resizedimage: a uint8 array representing the resized image.
% Author: Andrew Jin

% Establishing variables
[rows,cols,layers] = size(inputimage);
height = resize(1);
width = resize(2);
rrow = rows / height;
rcol = cols / width;

% Creating new image
resizedimage = zeros(height,width,layers,"uint8");
for i = 1:height
    for j = 1:width
        for k = 1:layers
            % Using Nearest Neighbour Interpolation Algorithm
            io = (i - 0.5) * rrow;
            jo = (j - 0.5) * rcol;
            io = ceil(io);
            jo = ceil(jo);
            % Assigning appropriate pixel values to new image
            resizedimage(i,j,k) = inputimage(io,jo,k);
        end
    end
end
end