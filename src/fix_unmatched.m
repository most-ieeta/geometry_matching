
%Assume K, y1, y2
ny1 = y1;
ny2 = y2;
nK  = K;

%Clears Y2
for i = size(ny2,1):-1:1
  if max(nK(:,2)==i) == 0 %%For the unmatched points
    %First, remove from the ny2
    ny2(i,:) = [];
    %Second, update K
    nK(:,2) = nK(:,2) - 1 * (nK(:,2) >= i);
  endif
end

%Clears Y1 - unmatched AND double points
%Remove unmatched points
for i = size(ny1,1):-1:1
  %Remove unmatched points
  if max(nK(:,1)==i) == 0 %%For the unmatched points
    %First, remove from the ny1
    ny1(i,:) = [];
    %Second, update K
    nK(:,1) = nK(:,1) - 1 * (nK(:,1) >= i);
  endif  
end
%Remove double points
for i = 1:size(nK, 1)
  while i < size(nK,1) && sum(nK(:,2)==nK(i,2)) > 1 %Double points
    to_remove = nK(i, 1);
    
    %First, remove from the ny1
    ny1(to_remove,:) = [];
    %Second, remove it from K
    nK(i,:) = [];
    %Third, update K
    nK(:,1) = nK(:,1) - 1 * (nK(:,1) >= to_remove);
  end
end

