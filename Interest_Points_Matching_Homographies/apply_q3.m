disp('Question 3 - Descriptors and Matching');
clear
close all

img1 = imread('images/graff5/img1.ppm');
img2 = imread('images/graff5/img2.ppm');
%img1 = imread('images/office/1.jpg');
%img2 = imread('images/office/2.jpg');

sigma1 = 2.0;
sigma2 = 1.6;
threshold = 1000;

% parameters for regional descriptors
m = 41;
bins = 16;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% estimate the Harris keypoints for first image
ImageRes = compute_harris(img1, sigma1, sigma2);
[px1, py1] = non_max_suppression(ImageRes, threshold);

% estimate the Harris keypoints for second image
ImageRes = compute_harris(img2, sigma1, sigma2);
[px2, py2] = non_max_suppression(ImageRes, threshold);

% draw points
%drawpoints(img1, px1, py1, 'red');

% regional descriptors
D1 = descriptors_rg(img1, px1, py1, m, bins);
D2 = descriptors_rg(img2, px2, py2, m, bins);
%D1 = descriptors_dxdy(double(rgb2gray(img1)), px1, py1, m, sigma2, bins);
%D2 = descriptors_dxdy(double(rgb2gray(img2)), px2, py2, m, sigma2, bins);

% find best matching points using Euclidean distance
[match_index, match_dist] = findnn(D1, D2); %TODO: fill in this function

% visualization of matching
N = 10;
displaymatches(img1, px1, py1, img2, px2, py2, match_index, match_dist, N);
