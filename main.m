clc, clearvars, close all

% Read the images
ref = imread('data/reference-pack.jpg');
img = imread('data/test-pack.jpg');

% Segment used pills
y = segment(img, ref, 0.6);

% Find boundaries for the segmented pills
B = bwboundaries(y, 'noholes');
 
% Display results
figure;
subplot(3,1,1),  imshow(img),   title('Test image')
subplot(3,1,2),  imshow(y),     title('Segmented pills')
subplot(3,1,3),  imshow(img),   title(['Used pills: ',num2str(length(B))])
hold on
for k=1:length(B)
   boundary = B{k};
   plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth',2)
end