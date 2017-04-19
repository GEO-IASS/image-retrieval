function ResImage = compute_harris(img, sigma1, sigma2)
if (ndims(img) == 3)
    img = rgb2gray(img);
end
img = double(img);

% First we make a 2D  "derivative of gaussian" filter
%%%automatically chooses the window size dependent on sigma. the other way is to consider it as a parameter (e.g. 3*3 or 7*7)
x = [floor(-3.0*sigma1+0.5):floor(3.0*sigma1+0.5)];
G = gauss(x,sigma1);
D = gaussdx(x,sigma1);
g = G'*D;

% compute Dx
imgDx = conv2(img,g,'same');

% compute Dy
imgDy = conv2(img,g','same');

% Gaussian 3x3 filter
%%%TODO: build a gaussian filter with "fspecial" command and compute C matrix
gFilter = fspecial('gaussian', [3 3], sigma2);
%dmatrix = [imgDx.^2  imgDx.*imgDy; imgDx.*imgDy imgDy.^2];
%C = conv2(gmatrix, dmatrix,'same')

alpha = 0.06;
%R = det(C) - alpha * trace(C)^2
%%%TODO: put the final results in "ResImcage" variable

C = imfilter(imgDx.^2,gFilter).*imfilter(imgDy.^2,gFilter) - (imfilter(imgDx.*imgDy,gFilter)).^2 - ...
    alpha*(imfilter(imgDx.^2,gFilter) + imfilter(imgDy.^2,gFilter)).^2;
ResImage = C;

%ResImage = zeros(size(img));
%[height width] = size(img);


%for i = 1 : height
 %   for j = 1 : width
  %      if(img(i,j)>R)
   %          ResImage(i,j) = img(i,j);
    %    end
    %end
%end


end
