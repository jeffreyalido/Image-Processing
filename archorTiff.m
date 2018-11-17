%% 
% Select up to 24 tiff files!
% Fit a microscope image of a print to the mask by rotating, scaling and
% translating.

%% select an image anywhere in your computer
clear
clc
curD = pwd;
[filename, pathname] = uigetfile('*.tif','Select image','MultiSelect','on');
fullPicPath = strcat(pathname,filename);
cd(pathname)
% if ~exist(filename)
%     cd(pathname);
% end
% picmat = imread();
% picmat = ceil(im2double(picmat));
% cd(curD);
bigCanvas = zeros(4*600,6*600);
for i = 1 : length(filename)
    if ~exist(filename{i})
        cd(pathname);
    end
    picmat = imread(filename{i});
    cd(curD);
    imshow(picmat);
    [x, y] = ginputc(5, 'Color', 'r', 'LineWidth', .5);
    y = round(y); x = round(x);
    %% find angle to rotate

    %given p1 is top left marker and p2 is top right marker
    ys = [y(1) y(2)];
    xs = [x(1) x(2)];

    slope = (ys(1) - ys(2)) / (xs(1) - xs(2)); %slope of that line to flatten out with "theta" rotation 
    theta = atand(slope);

    %Accounting for how there are two different marker selections that give the
    %same slope, but different orientations.
    if slope > 0
        if x(1) > x(2)
            theta = theta + 180;
        end
    else
        if x(1) > x(2)
            theta = theta + 180;
        end
    end

    %% find new marker coordinates after rotation
    s = size(picmat);
    marker1 = zeros(s(1:2));
    marker2 = zeros(s(1:2));
    marker3 = zeros(s(1:2));

    marker1(y(1):y(1)+1,x(1)) = 1;
    marker_rot1 = imrotate(marker1,theta);
    [my1,mx1] = find(marker_rot1);

    marker2(y(2):y(2)+1,x(2)) = 1;
    marker_rot2 = imrotate(marker2,theta);
    [my2,mx2] = find(marker_rot2);

    marker3(y(3):y(3)+1,x(3)) = 1;
    marker_rot3 = imrotate(marker3,theta);
    [my3,mx3] = find(marker_rot3);

    %% rotating and cropping image
    rotImage = imrotate(picmat, theta);

    cropImage = rotImage(my1(1) : my3(1), mx1(1) : mx2(1));

    %% scale and fit cropped image onto 1024x1024 zero matrix

    scaledImage = imresize(cropImage,[600 600]);
    scaledImage = im2double(scaledImage);
    canvas = zeros(1024,1024);
    
    canvas(200:799, 200:799) = scaledImage;
    cd(pathname);
    mkdir('anchored');
    cd('anchored');
    imwrite(scaledImage,strcat(filename{i},'_',num2str(i),'.png'),'png');
    
    if i == 1
        bigCanvas(1:600,1:600) = scaledImage;
    elseif i == 2
        bigCanvas(1:600,601:1200) = scaledImage;
    elseif i == 3
        bigCanvas(1:600,1201:1800) = scaledImage;
    elseif i == 4
        bigCanvas(1:600,1801:2400) = scaledImage;
    elseif i == 5
        bigCanvas(1:600,2401:3000) = scaledImage;
    elseif i == 6
        bigCanvas(1:600,3001:3600) = scaledImage;
    elseif i == 7
        bigCanvas(601:1200,1:600) = scaledImage;
    elseif i == 8
        bigCanvas(601:1200,601:1200) = scaledImage;
    elseif i == 9
        bigCanvas(601:1200,1201:1800) = scaledImage;
    elseif i == 10
        bigCanvas(601:1200,1801:2400) = scaledImage;
    elseif i == 11
        bigCanvas(601:1200,2401:3000) = scaledImage;
    elseif i == 12
        bigCanvas(601:1200,3001:3600) = scaledImage;
    elseif i == 13
        bigCanvas(1201:1800,1:600) = scaledImage;
    elseif i == 14
        bigCanvas(1201:1800,601:1200) = scaledImage;
    elseif i == 15
        bigCanvas(1201:1800,1201:1800) = scaledImage;
    elseif i == 16
        bigCanvas(1201:1800,1801:2400) = scaledImage;
    elseif i == 17
        bigCanvas(1201:1800,2401:3000) = scaledImage;
    elseif i == 18
        bigCanvas(1201:1800,3001:3600) = scaledImage;
    elseif i == 19
        bigCanvas(1801:2400,1:600) = scaledImage;
    elseif i == 20
        bigCanvas(1801:2400,601:1200) = scaledImage;
    elseif i == 21
        bigCanvas(1801:2400,1201:1800) = scaledImage;
    elseif i == 22
        bigCanvas(1801:2400,1801:2400) = scaledImage;
    elseif i == 23
        bigCanvas(1801:2400,2401:3000) = scaledImage;
    elseif i == 24
        bigCanvas(1801:2400,3001:3600) = scaledImage;
    end
    
end
imshow(bigCanvas);
cd ..
imwrite(bigCanvas,'bigCanvastiff.png','png');
cd(curD);
