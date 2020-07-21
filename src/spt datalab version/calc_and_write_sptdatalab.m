function ret = calc_and_write_sptdatalab(y1,y2)
  set_globals;
  [K, S, best_cost, D1, D2, Dist1, Dist2] = shape_matching(y1, y2);
  
  ret = K;
  
end

    