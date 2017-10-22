function [lambda_vec, error_train, error_test] = ...
    testCurve(X, y, Xtest, ytest)
%TESTCURVE Generate the train and test errors needed to
%plot a test curve 
%   [lambda_vec, error_train, error_test] = ...
%       TESTCURVE(X, y, Xtest, ytest) returns the train
%       and test errors (in error_train, error_test)
%       for different values of lambda. You are given the training set (X,
%       y) and test set (Xtest, ytest).
%

% Selected values of lambda (you should not change this)
lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';

% You need to return these variables correctly.
error_train = zeros(length(lambda_vec), 1);
error_test = zeros(length(lambda_vec), 1);

for i = 1:length(lambda_vec)
    lambda = lambda_vec(i);
%   find theta parameter from training set, we need lambda here for regularization term
    [theta_train] = trainLinearReg(X, y , lambda);
%   calculate training set error (regularization term not included, lambda=0)
    error_train(i) = linearRegCostFunction(X, y, theta_train, 0);
%   calculate test set error (regularization term not included, lambda=0)
    error_test(i)   = linearRegCostFunction(Xtest, ytest, theta_train, 0);
end
% =========================================================================
end
