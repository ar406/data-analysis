#Uses correlation distance to find the most correlated sequences

#REQUIREMENTS:
#on Octave, requires statistics package: pkg load statistics

A = [0,1,0,0,1,1,1,1,1,1,0,1,1,0,0,0,0,0,1,1,1,0,0,0,1,1,0,0,0,1,0,1];
B = [0,1,0,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,1,0,0,0,1,0,1,0,1,0,1,0,1,0];
C = [1,1,1,1,1,0,1,1,0,0,0,0,0,1,1,1,0,0,0,1,1,0,0,0,1,0,1,1,1,0,0,0];

#compute correlation distance (0 for perfectly correlated distances)
sequence_matrix = [A;B;C];
rows = size(sequence_matrix,1);
distance_vector = pdist(sequence_matrix,'correlation');

#parse pdist output
[min_value, min_index] = min(distance_vector);
if min_index <= rows - 1
  first = 1;
  second = min_index + 1;
else
  first = 2;
  second = min_index - (cols - 1) + first;
end

#get most similar vectors
first_vector = sequence_matrix(first,:);
second_vector = sequence_matrix(second,:);

#output
fprintf('Lowest correlation distance: %f \n',min_value);
fprintf('Two sequences with lowest correlation distance: rows %d and %d \n',first,second);
disp(first_vector);
disp(second_vector);

