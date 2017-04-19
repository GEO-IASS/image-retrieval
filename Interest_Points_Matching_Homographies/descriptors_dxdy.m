function D = descriptors_dxdy(img, px, py, m, sigma, bins)
 
  img = double(img);
  rad   = round((m-1)/2);
  [h w c] = size(img);
  D = zeros(length(px),bins^2);
  
  for i=1:length(px)
    minx = max(px(i)-rad,1);
    maxx = min(px(i)+rad,w);
    miny = max(py(i)-rad,1);
    maxy = min(py(i)+rad,h);

    imgWin = img(miny:maxy, minx:maxx, :);  
    hist   = histdxdy(imgWin, sigma, bins); %%%TODO: complete this function
    D(i,:) = hist';
  end;
end
