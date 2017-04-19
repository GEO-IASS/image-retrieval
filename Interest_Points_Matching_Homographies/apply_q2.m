disp('Question 2 - Harris Detector');

fprintf('\n');

% Reading images
img1 = imread('gantrycrane.png');
img2 = imread('gantrycrane.png');

% you can verify your code with checkboard image
%img1 = checkerboard;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Estimate the Harris keypoints and overlay them on the image
sigma1 = 2.6;
sigma2 = 1.6;
ImageRes = compute_harris(img1, sigma1, sigma2); %TODO:complete this function

% non-maximum suppression
threshold = 100;
% spy(ImageRes)
[px, py] = non_max_suppression(ImageRes, threshold);

% draw points
drawpoints(img1, px, py, 'red');
fprintf('Parameters: sigma = %g, threshold = %d \n\n', sigma, threshold);

% Do you think it is possible to instead of defining a threshold for
% non-maximum suppression, it is possible to select N highest scoring
% points?
