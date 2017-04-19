figure(1)

points = zeros(50,2);

axis([-10 10 -10 10])
for i = 1 : 50
[x, y] = ginput(1);
points(i,1) = x;
points(i,2) = y;

hold on
plot(x,y,'rs')
end

save('points.mat', 'points');

