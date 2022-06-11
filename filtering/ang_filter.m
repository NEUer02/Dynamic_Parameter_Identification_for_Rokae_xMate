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

%% VISUALIZATION
for i = 1:7
	figure(i);
	plot(q_raw(:, i), 'g', 'LineWidth', 1.0); hold on;
	plot(q_filt(:, i), 'r', 'LineWidth', 0.5); hold off;
	title(['��', num2str(i), '�ؽ�λ���˲����'], 'FontSize', 17, 'FontName', '����');
	ylabel('�ؽڽǶ�(rad)', 'FontSize', 17, 'FontName', '����');
	legend('�˲�ǰ', '�˲���', 'FontName', '����', 'FontSize', 12);
    print(i, '-dpng', '-r600', [path_prefix, 'Joint', num2str(i), 'Rad.png']);
end

end