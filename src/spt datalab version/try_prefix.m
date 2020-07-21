
function [ny1, ny2, nK] = try_prefix(a, b, tsv)
  close all;
  y1 = dlmread(a, ' ');
  y2 = dlmread(b, ' ');
  
  if (size(y1,1) > size(y2,1))
    y3=y2;
    y2=y1;
    y1=y3;
  end
  
  K = dlmread(tsv, ' ');
  
  fix_unmatched;
  
  %viz_matching( y1,  y2,  K, 'lines', 'displaced');
  %%figure;
  %viz_matching(ny1, ny2, nK, 'lines', 'displaced');
  
  if exist('y3')
    ny3 = ny2;
    ny2 = ny1;
    ny1 = ny3;
    
    nK_temp = nK(:,1);
    nK(:,1) = nK(:,2);
    nK(:,2) = nK_temp;
  endif
end
