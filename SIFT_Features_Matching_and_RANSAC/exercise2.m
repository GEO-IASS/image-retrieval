%%
clear;
rng('shuffle');
% Load the points and plot them
load points.mat
figure(1), clf
plot(points(:,1), points(:,2), 'r+');
axis([-10 10 -10 10])


%% Select the number of trials
k = 10;
threshold = 1;
best_count = 0;
best_inliers_idx = [];

for i = 1 : k
    
    figure(1), clf
    plot(points(:,1), points(:,2), 'r+');
    axis([-10 10 -10 10])
    hold on
    
    %% select randomly 2 points as seed group, save their index in the variable 'id' and draw them on the previous figure    
    % TODO
    id = randi([1 size(points, 1)], 1, 2);
    plot(points(id,1), points(id,2), 'b*');
    
    %% Find the line that passes from those points y = ax + b
    % TODO find out what should be A and B
    p1 = points(id(1), :);
    p2 = points(id(2),:);
    
    A = [p1(1) 1; p2(1) 1];
    B = [p1(2); p2(2)];
    X = linsolve(A,B);
    
    % Show the line
    hold on
    line([-10 10], [X(1)*(-10)+X(2) X(1)*(10)+X(2)])
    
    
    % Count the inliers based on the projection
    a = X(1);
    b = -1;
    c = X(2);
    count = 0;
    inliers_idx = [];
    for j = 1:size(points, 1)
        % TODO compute distance of points to the line
        dist = abs(a * points(j,1) + b * points(j,2) + c)/(norm(a,b));
        % TODO count inliners and visualize them
        if(dist <= threshold)
            count = count +1;
            %plot(points(j,1), points(j,2), 'g*');
            inliers_idx = [inliers_idx j];
        end

    end
               % TODO keep best_count and best_inliers
            if(count > best_count)
                best_count = count;
                best_inliers_idx = inliers_idx;
                plot(points(j,1), points(j,2), 'g*');
            end 
   % pause
end

% find the line that passes from the selected inliers
inliers = points(best_inliers_idx,:);
y = inliers(:,1);
t = inliers(:,2);
[r,m,b] = regression(t,y);
figure
plotregression(t,y);


