function [Idx, Dist] = findnn(D1, D2)
%%%TODO:find nearest neighbour index and corresponding distance. hint:use "norm" function for computing euclidean distance.

[heightD1 widthD1] = size(D1);
[heightD2 widthD2] = size(D2);

for i=1:heightD1
      Dist(i) = norm(D1(i,:)-D2(1,:)) 
      Idx(i) = 1;
    for j=2:heightD2
        dist_new = norm(D1(i,:)-D2(j,:)) ; 
         if(dist_new<Dist(i))
             Dist(i) = dist_new;
             Idx(i) = j;
             
         end
         
    end
end
        
        
        
        
        
end       
% [pyD1, pxD1] = find(D1 > 0); 
% [pyD2, pxD2] = find(D2 > 0); 
% 
% size_D1 = size(pxD1,1)
% size_D2 = size(pxD2,1)
% 
% 
% for i=1:size_D1
%     Dist(i) = norm((pyD2(1)-pyD1(1)),(pxD2(1)-pxD1(1))); 
%     Idx(i) = 1;
%     for j=2:size_D2
%         dist_new = norm((pyD2(j)-pyD1(i)),(pxD2(j)-pxD1(i))); 
%         if(dist_new<Dist(i))
%             Dist(i) = dist_new;
%             Idx(i) = j;
%         end
%     end
% end

    
