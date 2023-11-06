function [friction] = compute_Stribeck_friction(qd, parameters, gamma)
[n_parameters, ~] = size(parameters);
if n_parameters == 5
    fc = parameters(1); fs = parameters(2); vs = parameters(3); fv = parameters(4); bias = parameters(5);
else
    fc = parameters(1); fs = parameters(2); vs = parameters(3); fv = parameters(4);
    bias = 0;
end

friction = sign(qd) .* (fc + (fs - fc) .* exp(-1 .* abs(qd / vs) .^ gamma)) + fv .* qd + bias;
end
