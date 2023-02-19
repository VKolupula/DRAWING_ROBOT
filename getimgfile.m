function img = getimgfile()
input_type = 0;
while input_type == 0
    input_type = inputdlg('Enter input type: ("1" for camera (Note: press any key to capture image)) or ("2" for image file)',...
                 'Input Type', [1 75]);
    input_type = str2num(input_type{1});
    if input_type == 1
        % w = webcam;
        w = webcam('USB2.0 PC CAMERA');  % Alternative syntax
        preview(w)
        pause
        img = snapshot(w);
        clear w
        break
    elseif input_type == 2
        % Load image from file
        x = inputdlg({'File name with extention (Note: Make sure all files are in the same directory)'},...
              'Image file Input', [1 50]); 
        img = imread(x{1});        
        break 
    else
        input_type = 0;
    end
end