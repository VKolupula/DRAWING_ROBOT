% Load image from file
img = imread( 'racecar.jpg' );

% Convert image to pixel 
[segmentsPix,xLimPix,yLimPix] = imageToPixelSegments(img);

% Identify initial position on whiteboard
Z_i = initialPosition();

% Draw image
drawImageFromPix(segmentsPix,xLimPix,yLimPix,Z_i)
