function [d] = HammingDistance(f1, f2)
% HammingDistance compares two image fingerprints and determines how many 
% corresponding positions differ with each other. The smaller the number
% of differing positions, the more similar the two images are.
% Inputs:
%     f1: a 1-by-n logical row vector for fingerprint 1.
%     f2: a 1-by-n logical row vector for fingerprint 2.
% Output:
%     d: an integer representing the number of differing bits (hamming
%        distance) between fingerprints 1 and 2.
% Author: Andrew Jin

% Checking if corresponding bits match
d = 0;
for i = 1:length(f1)
    if f1(i) ~= f2(i)
        d = d + 1;
    end
end
end