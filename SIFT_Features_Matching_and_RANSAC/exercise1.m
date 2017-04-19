%%
clear;

% Add the path to the VLFEAT toolbox and 
addpath('C:/Users/dante/Documents/MATLAB/vlfeat-0.9.20/toolbox/')
vl_setup

% Load the first image
img1 = imread('./images/img1.jpg');

figure(1)
imshow(img1)

% Convert to grayscale image
I = single(rgb2gray(img1));

% Compute the SIFT keypoints and descriptors
[f,d] = vl_sift(I);

% Visualize 50 randomly features
perm = randperm(size(f,2));
sel = perm(1:50);
h1 = vl_plotframe(f(:,sel));
set(h1,'color','k','linewidth',3);
h2 = vl_plotframe(f(:,sel));
set(h2,'color','y','linewidth',2);

% Visualize also how the descriptors look
h3 = vl_plotsiftdescriptor(d(:,sel),f(:,sel));
set(h3,'color','g');

%% Load the second image and calculate its descriptors

img2 = imread('./images/img2.jpg');


% Convert to grayscale image
I2 = single(rgb2gray(img2));

% Compute the SIFT keypoints and descriptors
[f2,d2] = vl_sift(I2); % Note that you should know the meaning of the output for the part below

%% For each SIFT descriptor in img1 find its correspondence in img2
% Store the distance between the SIFTs in the first image with the closest SIFTs in the second
distance = zeros(size(f,2),1); % store the distance between points in the first image and their matching points in the second image
match = zeros(size(f,2),1); % store the IDs of matching points in the second image
for i = 1:size(f,2)
    %% TODO
    distance(i) = norm(double(d(:,i)) - double(d2(:,1)));
    match(i) = 1;
    for j = 1:size(f2,2)
       dist_new = norm(double(d(:,i)) - double(d2(:,j)));
       if(dist_new < distance(i))
           distance(i) = dist_new;
           match(i) = j;
       end
    end    
end


%% Sort the points based on the distance and select the top 20 
topK = 20;
%% TODO get sel and sel2
sel2 = match(sel)';
seldistance = distance(sel);
[B,I] = sort(seldistance);
new_points = I(1:20);
sel = sel(new_points);
sel2 = sel2(new_points);

X1 = f(:, sel);
X2 = f2(:, sel2);

%% visualize the matching of selected interesting points
showCorrespondences(img1, img2, X1, X2) % TODO fill in the missing parts






