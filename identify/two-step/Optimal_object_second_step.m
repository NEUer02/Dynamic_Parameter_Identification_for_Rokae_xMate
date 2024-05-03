function [output] = Optimal_object_second_step(parameters)
error_for_friction_tmp = evalin('base', 'error_for_friction_tmp');
qd_filt_tmp = evalin('base', 'qd_filt_tmp');
gamma = evalin('base', 'gamma');

friction = compute_Stribeck_friction(qd_filt_tmp, parameters, gamma);

output = norm(error_for_friction_tmp - friction)^2;
end

