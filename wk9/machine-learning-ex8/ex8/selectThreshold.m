function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions
    % ypre = predicted y
    size_pval=size(pval,1);
    ypre=zeros(size_pval,1);
    tp=0;
    fp=0;
    fn=0;
    for ipval=1:size_pval
        if pval(ipval) < epsilon
            ypre(ipval)=1;
        end     
%        
%        if yval(ipval) == 1 && ypre(ipval)== 1
%            tp=tp+1;
%        elseif yval(ipval) == 0 && ypre(ipval)== 1
%            fp=fp+1;
%        elseif yval(ipval) == 1 && ypre(ipval)== 0
%            fn=fn+1;    
%        end   
%        
    end     
    tp = sum( (yval == 1) & (ypre == 1) );
    fp = sum( (yval == 0) & (ypre == 1) );
    fn = sum( (yval == 1) & (ypre == 0) );
%
    prec=tp/(tp+fp);
    rec=tp/(tp+fn);
    F1=2*prec*rec/(prec+rec);
    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
