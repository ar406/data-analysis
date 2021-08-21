#Uses histograms to find the most common intensity in a picture

#REQUIREMENTS:
#on Octave, requires image processing package: pkg load image

clear;
clc;
close all;

filename = input ('Please enter filename: ','s')
I = imread(filename);

#use histogram to find most common intensity 
[counts,binLocations] = imhist(I);
figure,imhist(I);
[max_value, max_index] = max(counts);
binLocations(max_index);
intensity_percent=100*binLocations(max_index)/255;

#find size in pixels
row_pixels=size(I(:,:,1),1); 
col_pixels=size(I(:,:,1),2);

#output
fprintf('Image size: %d * %d pixels \n', row_pixels, col_pixels);
fprintf('Most common intensity (0%%=black, 100%%=white): %d%% \n',intensity_percent);
