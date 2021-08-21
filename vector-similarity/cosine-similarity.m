#Uses cosine similarity to find the two most similar vectors in a set of three (same-size) vectors

#REQUIREMENTS:
#on Octave, requires statistics package: pkg load statistics

#sample values
A = [0,3,2,1,6,8,5,7,4,0,1,9];
B = [1,4,6,2,4,3,1,0,3,4,5,2];
C = [0,4,5,1,3,5,4,7,3,0,2,8];

#use cosine similarity to find the most similar vectors
score_matrix = [A;B;C];
rows = size(score_matrix,1);
distance_vector = pdist(score_matrix,'cosine');

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
first_vector = score_matrix(first,:);
second_vector = score_matrix(second,:);

#output
fprintf('Two most similar vectors: rows %d and %d \n',first,second);
disp(first_vector);
disp(second_vector);
