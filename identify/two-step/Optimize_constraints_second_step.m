function [c, ceq] = Optimize_constraints_second_step(parameters)
fc = parameters(1); fs = parameters(2); vs = parameters(3); fv = parameters(4);

physical_constraints1 = 0.1 - fv;
physical_constraints2 = -fc;
physical_constraints3 = -fs;

c = [physical_constraints1; physical_constraints2; physical_constraints3];
ceq = zeros(size(c));
end

