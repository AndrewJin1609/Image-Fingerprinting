function [farray] = FingerprintCollection(filenames, hash, resize)
% FingerprintCollection stores the image fingerprints from a list 
% of image filenames for easier comparison.
% Inputs:
%     filenames: an m-by-1 string array representing a list of image file 
%     names.
%     hash: a character vector containing either 'AvgHash' or 'Diffhash'.
%     resize: a character vector containing either 'Nearest' or 'Box'.
% Output:
%     farray: an m-by-1 cell array containing the fingerprint from each 
%     image file.
% Author: Andrew Jin

% Establishing variables
m = length(filenames);
farray = cell(m,1);
IF = @ImageFingerprint;

% Creating image fingerprint array
for i = 1:m
    imgarray = imread(filenames(i));
    farray{i} = IF(imgarray,hash,resize);
end
end