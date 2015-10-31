close;
clear;
clc;

%% read image
filename = 'tort.jpg';
I = imread(filename);
figure('name', 'source image');
imshow(I);

%% ----- pre-lab ----- %%
% output = function(input1, input2, ...);
% grey_scale function
I2 = grey_scale(I);

%% ----- homework lab ----- %%
% flip function
I3 = flip(I,0);
figure('name', 'flip horizontal');
imshow(I3);
I4 = flip(I,1);
figure('name', 'flip vertical');
imshow(I4);
I5 = flip(I,2);
figure('name', 'flip both');
imshow(I5);
%%
% rotation function
I6 = rotation(I, pi*3/4);
figure('name', 'rotate pi*3/4');
imshow(I6);

%% show image
figure('name', 'grey scale image'),
imshow(I2);

%% write image
% save image for your report
filename2 = 'gray scal.jpg';
imwrite(I2, filename2);

filename3 = 'flip horizontal.jpg';
imwrite(I3, filename3);
filename4 = 'flip vertical.jpg';
imwrite(I4, filename4);
filename5 = 'flip both.jpg';
imwrite(I5, filename5);
filename = 'rotate_135.jpg';
imwrite(I6, filename);





