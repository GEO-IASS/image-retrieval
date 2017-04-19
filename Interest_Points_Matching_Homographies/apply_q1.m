disp('Question 1 - Hessian Detector');

fprintf('\n');

%addpath('/software/matlab/current/toolbox/images/imdata/');
addpath('/workspace/matlab/ImageR1/questions/images');


% Reading images
img1 = imread('graf.png');
img2 = imread('graf.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% estimate the Hessian determinant for each pixel in the image
sigma = 1;

imgDet = compute_hessian(img1, sigma); %TODO:complete this function


% non-maximum suppression
threshold = 30;
[px, py] = non_max_suppression(imgDet, threshold);  %TODO:complete this function

% draw points
drawpoints(img1, px, py, 'red');
fprintf('Parameters: sigma = %g, threshold = %d \n\n', sigma, threshold);
disp('(Press enter)');
pause;
fprintf('\n');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% estimate the Hessian determinant for each pixel in the image
sigma = sigma;
imgDet = compute_hessian(img1, sigma);

% non-maximum suppression
threshold = 100;
[px, py] = non_max_suppression(imgDet, threshold);

% draw points
drawpoints(img1, px, py, 'red');
fprintf('Parameters: sigma = %g, threshold = %d \n\n', sigma, threshold);
disp('(Press enter)');
pause;
fprintf('\n');

