function [A, b] = Optimize_linear_constraints_Stribeck(parameters)
[n_parameters, ~] = size(parameters);
A = zeros(n_parameters, n_parameters);
b = zeros(n_parameters, 1);

for i = 92 : 4 : 116
    % fc
    A(i, i) = -1;
    % fs
    A(i + 1, i + 1) = -1;
    % fv
    A(i + 3, i + 3) = -1;
    b(i+2, 1) = -0.1;
end
end

