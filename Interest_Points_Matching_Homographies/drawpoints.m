function h = drawpoints(img, px, py, color)

  h = figure;
  colormap('gray');
  imagesc(img);
  hold on;
  
  for i = 1:length(px),
    plot(px(i), py(i), strcat(color,'+'));
  end;
  
  hold off;
  
end
