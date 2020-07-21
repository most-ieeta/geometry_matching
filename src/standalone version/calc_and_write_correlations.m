function calc_and_write_correlations(prefix, a, b)
  set_globals;
  global show_results;
  show_results=0;
  y1 = dlmread([prefix num2str(a, '%05u') '.png.pof'], ' ');
  y2 = dlmread([prefix num2str(b, '%05u') '.png.pof'], ' ');
  [K, S, best_cost, D1, D2, Dist1, Dist2] = shape_matching(y1, y2);
  dlmwrite([prefix '_corr_' num2str(a, '%05u') '_' num2str(b, '%05u') '.tsv'], K, ' ');
  
  [ny1, ny2, nK] = try_prefix(prefix, a, b);
  corrs = [ny1(nK(:,1),:) ny2(nK(:,2),:)];
  dlmwrite([prefix '_corr_' num2str(a, '%05u') '_' num2str(b, '%05u') '.corr'], corrs, " ");
end

