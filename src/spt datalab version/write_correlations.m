
function write_correlations(a, b)
  %corrs = zeros(size(k,1), 4);
  %for i = 1:size(k,1)
  %  corrs(i) = [y1(k(i,1)) y2(k(i,2))];
  %end

  %%%%%%%simp
  %[ny1, ny2, nK] = try_simp_pair(a, b);
  %corrs = [ny1(nK(:,1),:) ny2(nK(:,2),:)];
  %dlmwrite(['corr_' num2str(a) '_' num2str(b) '.corr'], corrs, " ");
  
  [ny1, ny2, nK] = try_full_pair(a, b);
  corrs = [ny1(nK(:,1),:) ny2(nK(:,2),:)];
  dlmwrite(['full_corr_' num2str(a) '_' num2str(b) '.corr'], corrs, " ");
end
