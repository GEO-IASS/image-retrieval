function [imgDet] = compute_hessian(img, sigma)
if (ndims(img) == 3)
    img = rgb2gray(img);
end

% Compute Hessian H
[imgDxx, imgDxy, imgDyy] = gaussderiv2(img, sigma);

% Compute Hessian determinant det(H)
%%%TODO:put the results in "imgDet" variable

sigma = 1;
imgDet = (sigma^4) * (imgDxx .* imgDyy - imgDxy.^2);

end
