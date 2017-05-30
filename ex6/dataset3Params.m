function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 0.01;
sigma = 0.01;

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
vec = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
m = size(vec,2);
model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
predictions = svmPredict(model, Xval);
err = mean(double(predictions ~= yval));

for i = 1:m
	C_demo = vec(i);
	for j = 1:m
		sigma_demo = vec(j);
		model= svmTrain(X, y, C_demo, @(x1, x2) gaussianKernel(x1, x2, sigma_demo));
		predictions = svmPredict(model, Xval);
		err_demo = mean(double(predictions ~= yval));
		if(err_demo < err)
			err = err_demo;
			C = C_demo;
			sigma = sigma_demo;
		end
	end
end


% =========================================================================

end
