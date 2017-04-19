function [px, py] = non_max_suppression(imgDet, threshold)


imMax = zeros(size(imgDet));
[height width] = size(imgDet);


for i = 2 : height-1
    for j = 2 : width-1
        if(imgDet(i,j) > imgDet(i-1,j-1) && imgDet(i,j) > imgDet(i-1,j) ...
            && imgDet(i,j) > imgDet(i-1,j+1) && imgDet(i,j) > imgDet(i,j-1) ...
            && imgDet(i,j) > imgDet(i,j+1) && imgDet(i,j) > imgDet(i+1,j-1)...
            && imgDet(i,j) > imgDet(i+1,j) && imgDet(i,j) > imgDet(i+1,j+1)) 
                imMax(i,j) =  imgDet(i,j);
        end
         %%%TODO: check if the current pixel is maximum in its 8 neihbourhood
    end
end

imgDetSup = imMax;

% Apply thresholding to find keypoints
[py, px] = find(imgDetSup > threshold); 
