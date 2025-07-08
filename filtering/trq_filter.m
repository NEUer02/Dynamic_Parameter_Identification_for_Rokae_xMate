function t_filt = trq_filter(n, ws, wc, t_raw, path_prefix)
%% torque_filter.m
% @brief: offline zero-phase butterworth filtering for torque
% @params[in] n: order of filter (5 by default)
% @params[in] ws: sampling frequency (10 by default)
% @params[in] wc: cut-off frequency (3 by default)
% @params[in] t_raw: raw joint torque data from sensors
% @params[out] t_filt: filtered joint torque data

% cut-off frequency
wn = wc / (ws / 2);		
% low-pass filter
[b, a] = butter(n, wn, 'low');
% zero-phase digital filtering
t_filt = filtfilt(b, a, t_raw);
% t_filt = zeros(size(t_raw));

t_filt = reshape(t_filt, 20001, 7);

%% VISUALIZATION
traj_Ts = 0.001;
[n_sample, ~] = size(t_raw);
t = linspace(0, n_sample - 1, n_sample) * traj_Ts;

for i = 1 : 7
    figure;
	plot(t, t_raw(:, i), 'LineWidth', 0.5); hold on;
	plot(t, t_filt(:, i), 'r', 'LineWidth', 0.5); hold off;
	% title(['No.', num2str(i), 'joint filted torque'], 'FontSize', 17);
	ylabel('关节力矩(N/m)', 'FontSize', 12);
    xlabel('时间(s)', 'FontSize', 12);
	legend('滤波前', '滤波后', 'FontSize', 12);
    grid on;
end

end



