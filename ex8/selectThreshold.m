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


	predictions = (pval < epsilon);

	TruePositive = sum((predictions==1) & (yval==1));
	FalsePositive = sum((predictions==1) & (yval==0));
	FalseNegative = sum((predictions==0) & (yval==1));
	TrueNegative = sum((predictions==0) & (yval==0));

	
	%求解Precision
	if(TruePositive + FalsePositive ~= 0)
		Precision = TruePositive / (TruePositive + FalsePositive);
	else
		Precision =0;
	end
	
	%求解Recall
	if(TruePositive + FalseNegative ~= 0)
		Recall = TruePositive / (TruePositive + FalseNegative);
	else
		Recall = 0;
	end
	
	%求解F1
	if(Precision + Recall ~= 0)
		F1 = 2 * (Precision * Recall) / (Precision + Recall);
	else
		F1 = 0;
	end




    % =============================================================
	%选出最合适的epsilon   F1越大，epsilon越准确
    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
