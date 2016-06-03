% This was developed by Mr. Sushil Pratap Bharati on May 21st, 2016 to
% annotate ground truth on images in a directory

% The code sucessfully extracts an image per widow and lets you manually annotate 
% i.e. (manually drag a rectangular box on required object in an image) 
% via rectangle. Right click then click on "Crop Image" when done. 
% 'ground_truth.txt' sucesfully records x1,y1,x2(i.e. x1+width) and y2(i.e. y1+height) of the bounding box drawn as you go along multiple images

contents = dir('your_directory_containing_images/*.jpg') % input your image dataset directory here with valid extension for image
fileid = fopen('ground_truth.txt','w+');% opens the file to write co-ordinates

for i = 1 : numel(contents)
  filename = contents(i).name;
  % Opens the file specified in filename
  [path name] = fileparts(filename);
  fname = sprintf('%s.jpg',name);
 figure('Name',fname,'NumberTitle','off');
    I = imread(fname); %reads the image
[I2,rect2] = imcrop(I); % records the co-ordinates, height and width of cropped image

%writes in text file
fprintf(fileid,'%d,%d,%d,%d\n',floor(rect2(1)),floor(rect2(2)),floor(rect2(1)+rect2(3)),floor(rect2(2)+rect2(4)));
close;
end



