function [f] = ImageFingerprint(imgarray, hash, resize)
% ImageFingerprint converts an RGB colour image into a 64-bit image
% fingerprint using specified hashing and resizing algorithms.
% Inputs:
%     imgarray: a uint8 array representing an RGB colour image.
%     hash: a character vector containing either 'Avghash' or 'Diffhash'.
%     resize: a character vector containing either 'Nearest' or 'Box'. 
% Output:
%     f: a 1-by-64 logical row vector representing the image fingerprint.
% Author: Andrew Jin

% Establishing variables
RN = @ResizeNearest;
RB = @ResizeBox;
AH = @AvgHash;
DH = @DiffHash;
imgarray = GreyscaleLuma(imgarray);

% Applying appropriate resizing and hashing functions
if strcmp(hash, 'AvgHash')
    if strcmp(resize, 'Nearest')
        r_img = RN(imgarray, [8 8]);
    elseif strcmp(resize, 'Box')
        r_img = RB(imgarray, [8 8]);
    end
    f = AH(r_img);
end

if strcmp(hash, 'DiffHash')
    if strcmp(resize, 'Nearest')
        r_img = RN(imgarray, [8 9]);
    elseif strcmp(resize, 'Box')
        r_img = RB(imgarray, [8 9]);
    end
    f = DH(r_img);
end
end