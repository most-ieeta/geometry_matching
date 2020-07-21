clear('all');
close('all');
clc;
delete('results.txt');

categories = ls('bswan_full/');

for cat = 1:size(categories,1)
  disp(["Calculating for " categories(cat,:)]);
  mkdir(['test_brown/workspaces/' categories(cat,:)]);
  mkdir(['test_brown/figs/' categories(cat,:)]);
  
  #Compares multi simplification
  files = ls(['test_brown/pof/' categories(cat,:) '/msimp*']);
  for i = 1:size(files,1)
    for j = (i+1):size(files,1)
      #disp(['comparing ' files(i,:) ' and ' files(j,:)])
      Y1=csvread(files(i,:)); 
      Y2=csvread(files(j,:)); 
      
      set_globals
      [K, S, best_cost, D1, D2, Dist1, Dist2] = shape_matching(Y1, Y2);

      [_, file1, _] = fileparts(files(i,:));
      [_, file2, _] = fileparts(files(j,:));
      
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
      fprintf(f,"m,%s,%s,%s,%f\n", categories(cat,:), file1, file2, best_cost);
      fclose(f);
    end
  end
  
  #Compares single simplification
  files = ls(['test_brown/pof/' categories(cat,:) '/simp*']);
  for i = 1:size(files,1)
    for j = (i+1):size(files,1)
      #disp(['comparing ' files(i,:) ' and ' files(j,:)])
      Y1=csvread(files(i,:)); 
      Y2=csvread(files(j,:)); 
      
      set_globals
      [K, S, best_cost, D1, D2, Dist1, Dist2] = shape_matching(Y1, Y2);

      [_, file1, _] = fileparts(files(i,:));
      [_, file2, _] = fileparts(files(j,:));
      
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
      fprintf(f,"s,%s,%s,%s,%f\n", categories(cat,:), file1, file2, best_cost);
      fclose(f);
    end
  end
  break
end