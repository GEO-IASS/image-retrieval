function h=histdxdy(img, sigma, bins)

  % compute the first derivatives
x = [floor(-3.0*sigma+0.5):floor(3.0*sigma+0.5)];
G = gauss(x,sigma);
D = gaussdx(x,sigma);
g = G'*D;

% compute Dx
imgDx = conv2(img,g,'same');
% compute Dy
imgDy = conv2(img,g','same');
  
  %map the values to [0 159]
  a=min(imgDx(:)); b=max(imgDx(:)); imgDx=159/(b-a)*(imgDx-a);
  a=min(imgDy(:)); b=max(imgDy(:)); imgDy=159/(b-a)*(imgDy-a);
    
  %define a 2D histogram  with "bins*bins" number of entries
  h=zeros(bins,bins);

  %TODO: quantize the images to "bins" number of values

  %normalize the histogram such that its integral (sum) is equal 1
  h=h/sum(sum(h));
  h=reshape(h,bins^2,1);
end
