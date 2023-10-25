clear, clc, clf, close all;

% q_raw = load('.\data\excit\excit_ang_record.txt');
% qd_raw = load('.\data\excit\excit_vel_record.txt');
% qdd_raw = load('.\data\excit\excit_acc_record.txt');
t_raw = load('.\data\excit\excit_torque_record.txt');

% order of filter
n = 5;
% sampling frequency 
ws = 100;
% cut-off frequency
wc = 3;

wn = wc / (ws / 2);		
% low-pass filter
[b, a] = butter(n, wn, 'low');
% zero-phase digital filtering
t_filt = filtfilt(b, a, t_raw);
t_smooth = zeros(size(t_filt));

for i = 1 : 7
    t_smooth(:, i) = smooth(t_filt(:, i), 300, 'rloess');
    figure(i);
    plot(t_filt(:, i)); 
    hold on;
    plot(t_smooth(:, i), 'LineWidth', 0.5);
    hold off;
    title(['第', num2str(i), '关节力矩滤波+平滑结果'], 'FontSize', 17, 'FontName', '宋体');
	ylabel('关节力矩(N/m)', 'FontSize', 17, 'FontName', '宋体');
    legend('平滑前', '平滑后', 'FontSize', 12, 'FontName', '宋体');
end