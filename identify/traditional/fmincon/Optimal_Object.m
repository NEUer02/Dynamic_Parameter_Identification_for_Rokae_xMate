function [output] = Optimal_Object(parameters)
    t_filt = evalin('base', 't_filt');
    ww = evalin('base', 'ww');

    torque_matrix_tmp = ww * parameters;
    torque_matrix = reshape(torque_matrix_tmp, 7, []);

    output = norm(t_filt - torque_matrix')^2;
end
