
function [ny1, ny2, nK] = try_full_pair(a,b)
  close all;
  y1 = csvread(['v1_2_DJI_0003_0006_0007_' num2str(a) '.pof']);
  y2 = csvread(['v1_2_DJI_0003_0006_0007_' num2str(b) '.pof']);
  
  if (size(y1,1) > size(y2,1))
    y3=y2;
    y2=y1;
    y1=y3;
  endif
  
  K = csvread(['full_corr_' num2str(a) '_' num2str(b) '.csv']);
  
  fix_unmatched;
  
  viz_matching( y1,  y2,  K, 'lines', 'displaced');
  figure;
  viz_matching(ny1, ny2, nK, 'lines', 'displaced');
  
  if exist('y3')
    ny3 = ny2;
    ny2 = ny1;
    ny1 = ny3;
    
    nK_temp = nK(:,1);
    nK(:,1) = nK(:,2);
    nK(:,2) = nK_temp;
  endif
end
