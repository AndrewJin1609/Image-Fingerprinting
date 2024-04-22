function [resizedimage] = ResizeBox(imgarray, resize)
% ResizeBox resizes an image using the Box Sampling algorithm.
% Inputs:
%     imgarray: a uint8 array representing a greyscale or RGB image.
%     resize: a 1-by-2 double array representing the desired height and 
%     width of the resized image respectively.
% Output:
%     resizedimage: a uint8 array representing the resized image.
% Author: Andrew Jin

% Establishing variables
[rows,cols,layers] = size(imgarray);
height = resize(1);
width = resize(2);
boxes = cell(height,width,layers);

% Dividing image into grids
xgrid = linspace(0,cols,width + 1);
ygrid = linspace(0,rows,height + 1);

% Applying Box Sampling algorithm: if at least half the pixel's height and 
% width is within the box, it is counted as part of the box.
xfloor = floor(xgrid);
yfloor = floor(ygrid);
xoriginal = xfloor;
yoriginal = yfloor;
a = 1;
for k = 1:layers
    % Calculating x-range:
    for x = 2:length(xgrid)

        % If number ends in .5
        if xgrid(x) == floor(xgrid(x)) + 0.5
            x1 = xfloor(x - 1) + 1;
            x2 = xfloor(x) + 1;
        
        % If number rounds down
        elseif round(xgrid(x)) == floor(xgrid(x))
            x1 = xfloor(x - 1) + 1;
            x2 = xfloor(x);
        
        % If number rounds up
        elseif round(xgrid(x)) == ceil(xgrid(x))
            x1 = xfloor(x - 1) + 1;
            x2 = xfloor(x) + 1;
            xfloor(x) = xfloor(x) + 1;
        end
        xrange = x1:x2;

        % Calculating y-range:
        for y = 2:length(ygrid)
                
                % If number ends in .5
                if ygrid(y) == floor(ygrid(y)) + 0.5
                    y1 = yfloor(y - 1) + 1;
                    y2 = yfloor(y) + 1;
                
                % If number rounds down
                elseif round(ygrid(y)) == floor(ygrid(y))
                    y1 = yfloor(y - 1) + 1;
                    y2 = yfloor(y);
            
                % If number rounds up
                elseif round(ygrid(y)) == ceil(ygrid(y))
                    y1 = yfloor(y - 1) + 1;
                    y2 = yfloor(y) + 1;
                    yfloor(y) = yfloor(y) + 1;
                end
                yrange = y1:y2;

                % Storing pixels that are included in the box
                boxes{a} = double(imgarray(yrange,xrange,k));
                a = a + 1;
        end

    % Reverting any changes done to y grid
    yfloor = yoriginal;
    end

% Reverting any changes done to x grid
xfloor = xoriginal;
end

% Creating new image
resizedimage = zeros(height,width,layers,"uint8");
for i = 1:numel(boxes)
    boxpixels = boxes{i};
    resizedimage(i) = mean(boxpixels, "all");
end
end