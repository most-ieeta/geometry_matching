clear('all');
close('all');
clc;
delete('results.txt');
graphics_toolkit gnuplot;

%categories = ls('test_brown/pof/');
%categories = ['arb'; 'swa'; 'sky'; 'din'];
categories = ['rat'];
percents = [0.25; 0.5; 0.75];
tim_value = [0.25; 0.5; 0.75; 1; 5; 10];

for per = 1:size(percents)
  for tempo = 1:size(tim_value)
for cat = 1:size(categories,1)
  disp(["Calculating for " categories(cat,:)]);
  mkdir(['test_brown/workspaces/' categories(cat,:)]);
  mkdir(['test_brown/figs/' categories(cat,:)]);
  
  files = ls(['test_brown/pof/' categories(cat,:) '/*']);
  for i = 1:size(files,1)
    for j = (i+1):size(files,1)
      disp(['===================================================================' num2str(i) ' ' num2str(j) '===================================================================']);
      %if (j <= i)
      %  break;
      %endif
      
      disp(['comparing ' files(i,:) ' and ' files(j,:)])
      [p, file1, _] = fileparts(files(i,:));
      [_, file2, _] = fileparts(files(j,:));
      cd(p);
      system(['../../../simp.sh ' file1 '.pof ' file2 '.pof ' num2str(tim_value(tempo)) ' ' num2str(percents(per)) ' > /dev/null']);
      system('sed -e "s/ /,/" -i msimp*');
      system('sed -e "s/ /,/" -i simp*');
      cd ..;
      cd ..;
      cd ..;
      
      #Multi simp
      Y1=csvread([p '/msimp_' file1 '.pof']); 
      Y2=csvread([p '/msimp_' file2 '.pof']); 
      
      set_globals
      [K, S, best_cost, D1, D2, Dist1, Dist2] = shape_matching(Y1, Y2);
      
      save(['test_brown/workspaces/' categories(cat,:) '/m' file1 '_' file2 '.w']);
      print(['test_brown/figs/' categories(cat,:) '/'  file1 '_' file2 'm_7.jpg']);
      close;
      print(['test_brown/figs/' categories(cat,:) '/'  file1 '_' file2 'm_6.jpg']);
      close;
      print(['test_brown/figs/' categories(cat,:) '/'  file1 '_' file2 'm_5.jpg']);
      close;
      print(['test_brown/figs/' categories(cat,:) '/'  file1 '_' file2 'm_4.jpg']);
      close;
      print(['test_brown/figs/' categories(cat,:) '/'  file1 '_' file2 'm_3.jpg']);
      close;
      print(['test_brown/figs/' categories(cat,:) '/'  file1 '_' file2 'm_2.jpg']);
      close;
      print(['test_brown/figs/' categories(cat,:) '/'  file1 '_' file2 'm_1.jpg']);
      close;

      f = fopen('results.txt', 'a');
      fprintf(f,"m,%f,%f,%s,%s,%s,%f\n", percents(per), tim_value(tempo), categories(cat,:), file1, file2, best_cost);
      fclose(f);
      
      if (tempo == 1)
      #Single simp
      Y1=csvread([p '/simp_' file1 '.pof']); 
      Y2=csvread([p '/simp_' file2 '.pof']); 
      
      set_globals
      [K, S, best_cost, D1, D2, Dist1, Dist2] = shape_matching(Y1, Y2);

      save(['test_brown/workspaces/' categories(cat,:) '/s' file1 '_' file2 '.w']);      
      print(['test_brown/figs/' categories(cat,:) '/'  file1 '_' file2 's_7.jpg']);
      close;
      print(['test_brown/figs/' categories(cat,:) '/'  file1 '_' file2 's_6.jpg']);
      close;
      print(['test_brown/figs/' categories(cat,:) '/'  file1 '_' file2 's_5.jpg']);
      close;
      print(['test_brown/figs/' categories(cat,:) '/'  file1 '_' file2 's_4.jpg']);
      close;
      print(['test_brown/figs/' categories(cat,:) '/'  file1 '_' file2 's_3.jpg']);
      close;
      print(['test_brown/figs/' categories(cat,:) '/'  file1 '_' file2 's_2.jpg']);
      close;
      print(['test_brown/figs/' categories(cat,:) '/'  file1 '_' file2 's_1.jpg']);
      close;

      f = fopen('results.txt', 'a');
      fprintf(f,"s,%f,%f,%s,%s,%s,%f\n", percents(per), tim_value(tempo), categories(cat,:), file1, file2, best_cost);
      fclose(f);
      endif
      
      delete([p '/msimp*']);
      delete([p '/simp*']);
    end
  end
end
end
end
