% Load or Capture image 
clear
img = getimgfile();

% Convert image to pixel segments
[segmentsPix,xLimPix,yLimPix] = imageToPixelSegments(img);
getpreview();

% Identify initial position on whiteboard
Z_i = initialPosition();

% Draw image
drawImageFromPix(segmentsPix,xLimPix,yLimPix,Z_i)