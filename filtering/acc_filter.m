function qdd_filt = acc_filter(n, ws, wc, input, mode, path_prefix)
%% acc_filtering.m
% @brief: offline zero-phase butterworth filtering for qdd (joint acceleration)
% @params[in] n: order of filter (5 by default)
% @params[in] ws: sampling frequency (10 by default)
% @params[in] wc: cut-off frequency (3 by default)
% @params[in] input: qdd_raw for sensor reading, qd_filt for derivative
% @params[in] mode: "sensor" or "derivate"
% @params[out] qdd_filtered: filtered joint acceleration data

% cut-off frequency
wn = wc / (ws / 2);		
% low-pass filter
[b, a] = butter(n, wn, 'low');
% sampling period  
Ts = 1 / ws;    

%% FILTERING
if mode == "derivate"
	len = length(input(:, 1));	 % input is qd_filt and length is 200
	qdd_pre_filt = zeros(len, 7);

	for k = 2:len-1
		qdd_pre_filt(k, :)= (input(k+1,:) - input(k-1,:)) / (2 * Ts);
	end
	qdd_pre_filt(1, :) = qdd_pre_filt(2, :);
	qdd_pre_filt(len, :) = qdd_pre_filt(len-1, :);
elseif mode == "sensor"
	qdd_pre_filt = input;  % input is qd_raw
end
qdd_filt = filtfilt(b, a, qdd_pre_filt);
% for i = 1 : 7
%     qdd_filt(:, i) = smooth(qdd_filt(:, i), 200);
% end
qdd_filt = reshape(qdd_filt, 20001, 7);

%% VISUALIZATION
traj_Ts = 0.001;
[n_sample, ~] = size(qdd_pre_filt);
t = linspace(0, n_sample - 1, n_sample) * traj_Ts;

for i = 1:7
	figure; 
	plot(t, qdd_pre_filt(:,i), 'g', 'LineWidth', 1.5); hold on;
	plot(t, qdd_filt(:, i), 'r', 'LineWidth', 1.5); hold off;
	% title(['��', num2str(i), '�ؽڼ��ٶ��˲����'], 'FontSize', 12, 'FontName', '����');
	ylabel('�ؽڼ��ٶ�(rad/s^{2})', 'FontSize', 12, 'FontName', '����');
	legend('�˲�ǰ', '�˲���', 'FontName', '����', 'FontSize', 12);
end

end
