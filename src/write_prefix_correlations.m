
function write_prefix_correlations(prefix, a, b)
  [ny1, ny2, nK] = try_prefix(prefix, a, b);
  corrs = [ny1(nK(:,1),:) ny2(nK(:,2),:)];
  dlmwrite([prefix '_full_corr_' num2str(a, '%05u') '_' num2str(b, '%05u') '.corr'], corrs, " ");
end
