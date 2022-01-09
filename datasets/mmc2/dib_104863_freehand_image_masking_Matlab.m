if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.
fontSize = 16;

grayImage = imread('F:\Thesis_And_All\Papers_and_Survey\04_Forth_Paper_data_in_breif\2019_Data_Forth_Paper\Dataset_BUSI_with_GT\malignant\malignant (94).png');
imshow(grayImage, []);
axis on;
title('Original Grayscale Image', 'FontSize', fontSize);
set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.

% Ask user to draw freehand mask.
message = sprintf('Left click and hold to begin drawing.\nSimply lift the mouse button to finish');
uiwait(msgbox(message));
hFH = imfreehand(); % Actual line of code to do the drawing.
% Create a binary image ("mask") from the ROI object.
binaryImage = hFH.createMask();
xy = hFH.getPosition;

% Now make it smaller so we can show more images.
subplot(2, 4, 1);
imshow(grayImage, []);
axis on;
drawnow;
title('Original gray scale image', 'FontSize', fontSize);

% Display the freehand mask.
imshow(binaryImage);
imwrite(binaryImage, 'F:\Thesis_And_All\Papers_and_Survey\04_Forth_Paper_data_in_breif\2019_Data_Forth_Paper\Dataset_BUSI_with_GT\malignant\malignant (94)_mask.png');