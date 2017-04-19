%%
clear;
% Add the path to the VLFEAT toolbox and 
addpath('/users/visics/xjia/src/vlfeat-0.9.17/toolbox/')
vl_setup

% use the results obtained from exercise1
exercise1;

%
X1 = f(:,sel);
X2 = f2(:,sel2);

addpath(genpath('./allfns'))

X1 = X1(1:2,:);X1(3,:) = 1;
X2 = X2(1:2,:);X2(3,:) = 1;


C1 = vgg_conditioner_from_pts(X1);
C2 = vgg_conditioner_from_pts(X2);
X1 = C1*X1;
X2 = C2*X2;

% Apply Ransac 

ranscacK = 15;

H = cell(ranscacK,1);
ok = cell(ranscacK,1);
score = zeros(ranscacK,1);

for t = 1 : ranscacK
    
    id = randperm(size(X1,2), 14);
    
    px1 = X1(1,id);
    py1 = X1(2,id);
    
    px2 = X2(1,id);
    py2 = X2(2,id);
    
    [H_, Aa]= estimate_homography(px1,py1,px2,py2); % fill in the missing part
    
    H_ = inv(C2) * H_ * C1;
    
    H_ = H_/H_(3,3);
    
    H{t} = H_;
    
    % score homography by comparing the projection of X1 on img2 and X2
    % TODO

end

%%

[score, best] = max(score) ;
H_ = H{best} ;
ok = ok{best} ;

hom_gui_H(uint8(img1),uint8(img2),H_); % lets you visualize the corresponding point locations. Load the two images NewYork/im1.png and NewYork/im5.png and start the program as follows.This will open a window showing the two images side by side. Click on one image and describe what happens


%%

box2 = [1  size(img2,2) size(img2,2)  1 ;
        1  1           size(img2,1)  size(img2,1) ;
        1  1           1            1 ] ;
box2_ = inv(H_) * box2 ;
box2_(1,:) = box2_(1,:) ./ box2_(3,:) ;
box2_(2,:) = box2_(2,:) ./ box2_(3,:) ;
ur = min([1 box2_(1,:)]):max([size(img1,2) box2_(1,:)]) ;
vr = min([1 box2_(2,:)]):max([size(img1,1) box2_(2,:)]) ;

[u,v] = meshgrid(ur,vr) ;
im1_ = vl_imwbackward(im2double(img1),u,v) ;

z_ = H_(3,1) * u + H_(3,2) * v + H_(3,3) ;
u_ = (H_(1,1) * u + H_(1,2) * v + H_(1,3)) ./ z_ ;
v_ = (H_(2,1) * u + H_(2,2) * v + H_(2,3)) ./ z_ ;
im2_ = vl_imwbackward(im2double(img2),u_,v_) ;

mass = ~isnan(im1_) + ~isnan(im2_) ;
im1_(isnan(im1_)) = 0 ;
im2_(isnan(im2_)) = 0 ;
mosaic = (im1_ + im2_) ./ mass ;

figure(2) ; clf ;
imagesc(mosaic) ; axis image off ;
title('Mosaic') ;




