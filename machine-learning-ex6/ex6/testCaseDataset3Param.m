x1plot = linspace(-2, 2, 10)';
x2plot = linspace(-2, 2, 10)';
[X1, X2] = meshgrid(x1plot, x2plot);
X = [X1(:) X2(:)];
Xval = X + 0.3;
y = double(sum(exp(X),2) > 3);
yval = double(sum(exp(Xval),2) > 3);
[C sigma] = dataset3Params(X, y, Xval, yval)

% best C and sigma: 
%C = 0.1
%sigma = 1.0

% table of results for selected C and sigma
%   Errors      C        sigma
%   0.06000   0.10000   0.10000
%   0.04000   0.10000   0.30000
%   0.00000   0.10000   1.00000
%   0.06000   0.30000   0.10000
%   0.04000   0.30000   0.30000
%   0.04000   0.30000   1.00000
%   0.06000   1.00000   0.10000
%   0.04000   1.00000   0.30000
%   0.02000   1.00000   1.00000