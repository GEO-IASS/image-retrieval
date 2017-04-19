function showCorrespondences(img1, img2, X1, X2)

figure(1)
imshow([img1 img2])

h1 = vl_plotframe(X1);
h2 = vl_plotframe(X1);
set(h1,'color','k','linewidth',3);
set(h2,'color','y','linewidth',2);

%% TODO
% compute the new coordinates of points from X2 in the expanded image
X2(1,:) = X2(1,:) + size(img1,2);


h1 = vl_plotframe(X2);
h2 = vl_plotframe(X2);
set(h1,'color','k','linewidth',3);
set(h2,'color','y','linewidth',2);

%% TODO
% draw lines between matching points
for i=1:20
    hold on
    plot([X1(1,i),X2(1,i)],[X1(2,i),X2(2,i)]);
end
