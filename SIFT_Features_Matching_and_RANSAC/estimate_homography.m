function [H, A] = estimate_homography(px1,py1,px2,py2)

A = zeros(2*size(px1,1),9);

% Construct the A matrix  
w = 1; % index of equation
for i = 1 : size(px1,2)
    % TODO
end

% Perform SVD


% Take the last column of V
% TODO

H = reshape(h,3,3)';
end
