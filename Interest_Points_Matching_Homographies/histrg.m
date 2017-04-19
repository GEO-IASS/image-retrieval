function h = histrg(img, bins)

  %define a 2D histogram  with "bins^2" number of entries
  h = zeros(bins,bins);

  %execute the loop for each pixel in the image
  for i=1:size(img,1)
    for j=1:size(img,2)
      
      %increment a histogram bin which corresponds to the value 
      %of pixel i,j; h(r,g)
      R = img(i,j,1);
      G = img(i,j,2);
      B = img(i,j,3);
      
      r = floor( R/(R+G+B) *bins)+1;
      g = floor( G/(R+G+B) *bins)+1;
      if r==bins+1, r = bins; end;
      if g==bins+1, g = bins; end;
      
      h(r,g) = h(r,g) + 1;

    end
  end
  %normalize the histogram such that its integral (sum) is equal 1
  h=h/sum(sum(sum(h)));
  h=reshape(h,bins^2,1);
end
