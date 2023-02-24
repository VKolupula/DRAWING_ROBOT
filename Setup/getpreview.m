function getpreview()
tiledlayout(2,1)    
    % Top plot
nexttile
imshow(evalin('base','img'));
title('Input Image')
 
% Bottom plot
nexttile
segmentsPix = evalin('base','segmentsPix');
for ii = 1:numel(segmentsPix)
    coords = segmentsPix{ii};
    plot(coords(:,2),coords(:,1))
    hold on
end
hold off
axis ij equal
title('segmentsPix')