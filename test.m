%% 
% Insert this step in the workflow process right before using testq.m and after using archor.m
% create a front-end where user may select the boundaries of the underpolymerized area 
% and toggle the edge and gap values
% have users select the corners of the "square" using ginputc and use the
% coordinates to create a sub-matrix on which to run the edge analysis.
% have a while loop where it is terminated once the user indicates all underpolymerized areas are filled.
% basic outline of the individual analysis is shown below
%%
pic = imread('Set6.lif_Image036_ch00.tif_2.png');
pic = im2double(pic);

figure
imshow(pic)

[x, y] = ginputc(5, 'Color', 'r', 'LineWidth', .5);


picseg = pic(y(1) - 5 :y(3) + 5,x(1) - 5 : x(2) + 5);
figure
imshow(picseg)
picseg = imadjust(picseg);
imshow(picseg)


e = edge(picseg,'canny',.1); % .1
figure
imshow(e)

f = filledgegaps(e,10); % 8

figure
imshow(f)

g = imfill(f);

figure
imshow(g)

pic(y(1) - 5 :y(3) + 5,x(1) - 5 : x(2) + 5) = g;

figure
imshow(pic)
