function [] = DispFP(f)
% DispFP displays an image fingerprint in a more readable format on one 
% line.
% Input:
%     f: a 1-by-n logical row vector representing an image fingerprint.
% Output:
%     None.
% Author: Andrew Jin

%Establishing variables
f = double(f);
text = "";
remainder = mod(length(f),8);

% Creating 8 bit groups
for i = 1:8:length(f) - remainder
    for j = i:i+7
        bit = string(f(j));
        text = text + bit;   
    end
    % Concatenating group text
    text = text + " ";
end

% Adding remainder
if remainder ~= 0
    remainder = length(f) - remainder + 1;
    for i = remainder:length(f)
        bit = string(f(i));
        text = text + bit;  
    end
    % Concatenating group and remainder text
    text = text + " ";
end

% Displaying image fingerprint in desired format
text = char(text);
text(length(text)) = [];
fprintf(1, strcat(text, '\n'))
end