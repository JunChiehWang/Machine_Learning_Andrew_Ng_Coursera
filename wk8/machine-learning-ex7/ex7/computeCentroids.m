function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
k_array(1:K,1)=0;
for iex=1:m
    for ik=1:K
        if idx(iex) == ik
            k_array(ik,end+1)=iex;
            break
        end    
    end     
end     
k_array=k_array(:,2:end);

for ik=1:K
% find nonzero elements and put them in an array    
    k_array_tmp = find(k_array(ik,:));   
% find the coordinates of the corresponding examples    
    X_array=X(k_array_tmp,:);
    centroids(ik,:) = mean(X_array,1);
end
% =============================================================

end

