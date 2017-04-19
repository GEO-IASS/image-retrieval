function displaymatches(img1, px1, py1, img2, px2, py2, Idx, Dist, N)

  % sort the matches according to their scores
  [SDist SIdx] = sort(Dist,'ascend');

  % visualize the N best matches
  h1 = drawpoints(img1, px1, py1, 'y');
  h2 = drawpoints(img2, px2, py2, 'y');
  
  for i=1:N
    disp(['Match',num2str(i),': dist=',num2str(SDist(i))]);
    figure(h1); hold on; plot( px1(SIdx(i)), py1(SIdx(i)), 'ro' );
    ht = text( px1(SIdx(i))+5, py1(SIdx(i))+14, num2str(i) );
    set(ht,'Color',[1 0 0]); set(ht,'FontWeight','bold');
    
    figure(h2); hold on; plot( px2(Idx(SIdx(i))), py2(Idx(SIdx(i))), 'ro' );
    ht = text( px2(Idx(SIdx(i)))+5, py2(Idx(SIdx(i)))+14, num2str(i) );
    set(ht,'Color',[1 0 0]); set(ht,'FontWeight','bold');
    pause
  end;
  close all;
end
