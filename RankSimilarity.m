function [] = RankSimilarity(f, names, prints, n)
% RankSimilarity displays image files ranked by descending similarity.
% Inputs:
%     f: a 1-by-64 logical row vector representing the image fingerprint 
%     to search.
%     names: an m-by-1 string array representing a list of image file 
%     names.
%     prints: an m-by-1 cell array containing a collection of image 
%     fingerprints.
%     n: an integer denoting how many image fingerprint matches to display.
% Output:
%     None.
% Author: Andrew Jin

% Establishing variables
HD = @HammingDistance;
distances = zeros(1,length(prints));

% Calculating hamming distance of each image
for i = 1:length(prints)
    distances(i) = HD(f,prints{i});
end

% Sorting distances and filenames
[distances,fileorder] = sort(distances);
names = names(fileorder);

% Creating list text
rank = 1;
for i = 1:n

    % Adjusting for whitespace depending on the sizes of the list and the 
    % hamming distances
    if n < 10
        r = sprintf("%d. ",rank);
    else
        r = sprintf("%2d. ",rank);
    end

    if max(distances) < 10
        d = sprintf("%d - ",distances(i));
    else
        d = sprintf("%2d - ",distances(i));
    end
    
    filename = (names(i));
    rank = rank + 1;

    % Displaying text in desired format
    line = strcat(r,d,filename);
    fprintf(1,strcat(line,"\n"))
end
end