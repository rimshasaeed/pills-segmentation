function y = segment(x, ref, T)
% ARGUMENTS
%           x: used blister pack
%           ref: unused reference pack
%           T: threshold
% RETURNS
%           y: segmented image

% Convert to grayscale
if size(x, 3) > 1
    x = rgb2gray(x);
end
if  size(ref, 3) > 1
    ref = rgb2gray(ref);
end

% Binarize the image
x = imbinarize(x, T);
ref = imbinarize(ref, T);

% Remove small objects from binary image
x = bwareaopen(x, 1200);
mask = bwareaopen(ref, 1200);

% Subtract the image from mask
y = x - mask;
y = bwareaopen(y, 100);

end