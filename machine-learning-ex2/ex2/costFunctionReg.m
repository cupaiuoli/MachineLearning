function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


z = X * theta
h = sigmoid(z)

opEquals0 = -y' * log(h)
opEquals1 = (1 - y)' * (log(1 - h))

partialCost = opEquals0 - opEquals1
unregularizedCost = partialCost / m

% --- Cost function value ---
regularizationFactor = lambda * (sum(theta) / m);
J = unregularizedCost + regularizationFactor;

% --- Gradient ---
factor = ones(size(theta));
factor(1,1) = 0;
grad = 1/m * X' * (h-y) + lambda / m*factor.*theta;

% =============================================================

end
