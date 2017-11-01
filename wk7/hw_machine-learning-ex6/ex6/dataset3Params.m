function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
%C = 1;
%sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
c_array     = [0.01,0.03,0.1,0.3,1,3,10,30];
sigma_array = [0.01,0.03,0.1,0.3,1,3,10,30];
c_array_size     = size(c_array,2);
sigma_array_size = size(sigma_array,2);
c_sig_err=zeros(c_array_size*sigma_array_size,3);    
itemp=0;
for c_indx=c_array
    for sigma_indx=sigma_array
        itemp=itemp+1;
        c_sig_err(itemp,1)=c_indx;
        c_sig_err(itemp,2)=sigma_indx;
        % use X and y as training set to train the model a
        model= svmTrain(X, y, c_indx, @(x1, x2) gaussianKernel(x1, x2, sigma_indx)); 
        %subplot(8,8,itemp);
        %visualizeBoundary(Xval, yval, model);
        %pause
        predictions = svmPredict(model, Xval);
        error=mean(double(predictions ~= yval));
        c_sig_err(itemp,3)=error;
    end
end
[min_error,indx_min_error] = min(c_sig_err(:,3));
C = c_sig_err(indx_min_error,1);
sigma = c_sig_err(indx_min_error,2);
% =========================================================================
end
