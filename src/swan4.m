addpath('enrico');
for i = 61:78
  %calc_and_write_correlations('enrico/bswan_simp/simp_', i, i+1);
  %calc_and_write_correlations('enrico/bswan_full/', i, i+1);
  calc_and_write_correlations('enrico/car-turn/', i, i+1);
end
