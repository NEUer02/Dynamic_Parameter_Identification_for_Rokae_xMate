function q_filt = ang_filter(n, ws, wc, q_raw, path_prefix)
%% angle_filter.m
% @brief: offline zero-phase butterworth filtering for q (joint angle)
% @params[in] n: order of filter (5 by default)
% @params[in] ws: sampling frequency (10 by default)
% @params[in] wc: cut-off frequency (3 by default)
% @params[in] q_raw: raw joint angle data from sensors
% @params[out] q_filt: filtered joint angle data

% cut-off frequency
wn = wc / (ws / 2);
% low-pass filter
[b, a] = butter(n, wn, 'low');
% zero-phase digital filtering
q_filt = filtfilt(b, a, q_raw);
traj_Ts = 0.001;
[n_sample, ~] = size(q_raw);
t = linspace(0, n_sample - 1, n_sample) * traj_Ts;

%% VISUALIZATION 
for i = 1:7
    figure;
    plot(t, q_raw(:, i), 'g', 'LineWidth', 1.0); hold on;
    plot(t, q_filt(:, i), 'r', 'LineWidth', 1.0); hold off;
    % title(['第', num2str(i), '关节位置滤波结果'], 'FontSize', 12, 'FontName', '宋体');
    ylabel('关节角度(rad)', 'FontSize', 12, 'FontName', '宋体');
    xlabel('时间(s)', 'FontSize', 12, 'FontName', '宋体');
    legend('滤波前', '滤波后', 'FontName', '宋体', 'FontSize', 12);
    grid on;
end

end
