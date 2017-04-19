function [imgDxx,imgDxy,imgDyy]=gaussderiv2(img,sigma)
img = double(img);

% First we make a "gaussian" filter and a"derivative of gaussian" filter
%%%automatically chooses the window size dependent on sigma. the other way is to consider it as a parameter (e.g. 3*3 or 7*7)
x = [floor(-3.0*sigma+0.5):floor(3.0*sigma+0.5)];
G = gauss(x,sigma) %TODO: fill in this function
D = gaussdx(x,sigma) %TODO: fill in this function
g = G'*D

% compute Dx
imgDx = conv2(img,g,'same');

% compute Dy
imgDy = conv2(img,g','same');

% compute Dxx
imgDxx   = conv2(imgDx,g,'same');

% compute Dxy
imgDxy   = conv2(imgDx,g','same');

% compute Dyy
imgDyy   = conv2(imgDy,g','same');

end
