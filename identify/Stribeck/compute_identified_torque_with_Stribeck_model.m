function [output] = compute_identified_torque_with_Stribeck_model(parameters)
%% 准备工作与参数加载
qd_filt = evalin('base', 'qd_filt');
ww = evalin('base', 'ww');
gamma = evalin('base', 'gamma');
n_parameters = evalin('base', 'n_parameters');

%% 参数解包
m1 = parameters(1);   m2 = parameters(2);   m3 = parameters(3);   m4 = parameters(4);   m5 = parameters(5);   m6 = parameters(6);   m7 = parameters(7);
I1xx = parameters(8); I1xy = parameters(9); I1xz = parameters(10); I1yy = parameters(11); I1yz = parameters(12); I1zz = parameters(13); lc1x = parameters(14); lc1y = parameters(15); lc1z = parameters(16);
I2xx = parameters(17); I2xy = parameters(18); I2xz = parameters(19); I2yy = parameters(20); I2yz = parameters(21); I2zz = parameters(22); lc2x = parameters(23); lc2y = parameters(24); lc2z = parameters(25);
I3xx = parameters(26); I3xy = parameters(27); I3xz = parameters(28); I3yy = parameters(29); I3yz = parameters(30); I3zz = parameters(31); lc3x = parameters(32); lc3y = parameters(33); lc3z = parameters(34);
I4xx = parameters(35); I4xy = parameters(36); I4xz = parameters(37); I4yy = parameters(38); I4yz = parameters(39); I4zz = parameters(40); lc4x = parameters(41); lc4y = parameters(42); lc4z = parameters(43);
I5xx = parameters(44); I5xy = parameters(45); I5xz = parameters(46); I5yy = parameters(47); I5yz = parameters(48); I5zz = parameters(49); lc5x = parameters(50); lc5y = parameters(51); lc5z = parameters(52);
I6xx = parameters(53); I6xy = parameters(54); I6xz = parameters(55); I6yy = parameters(56); I6yz = parameters(57); I6zz = parameters(58); lc6x = parameters(59); lc6y = parameters(60); lc6z = parameters(61);
I7xx = parameters(62); I7xy = parameters(63); I7xz = parameters(64); I7yy = parameters(65); I7yz = parameters(66); I7zz = parameters(67); lc7x = parameters(68); lc7y = parameters(69); lc7z = parameters(70);
fc1 = parameters(71); fs1 = parameters(72); vs1 = parameters(73); fv1 = parameters(74);
fc2 = parameters(75); fs2 = parameters(76); vs2 = parameters(77); fv2 = parameters(78);
fc3 = parameters(79); fs3 = parameters(80); vs3 = parameters(81); fv3 = parameters(82);
fc4 = parameters(83); fs4 = parameters(84); vs4 = parameters(85); fv4 = parameters(86);
fc5 = parameters(87); fs5 = parameters(88); vs5 = parameters(89); fv5 = parameters(90);
fc6 = parameters(91); fs6 = parameters(92); vs6 = parameters(93); fv6 = parameters(94);
fc7 = parameters(95); fs7 = parameters(96); vs7 = parameters(97); fv7 = parameters(98);

if n_parameters == 105
    b1 = parameters(99); b2 = parameters(100); b3 = parameters(101); b4 = parameters(102); b5 = parameters(103); b6 = parameters(104); b7 = parameters(105); 
    bias = [b1 b2 b3 b4 b5 b6 b7];
else
    bias = zeros(7, 1);
end

fc = [fc1 fc2 fc3 fc4 fc5 fc6 fc7]';
fs = [fs1 fs2 fs3 fs4 fs5 fs6 fs7]';
fv = [fv1 fv2 fv3 fv4 fv5 fv6 fv7]';
vs = [vs1, vs2, vs3, vs4, vs5, vs6, vs7];

%% 物理参数集和最小参数集之间的转换
% MXi
MX1 = m1 * lc1x;
MX2 = m2 * lc2x;
MX3 = m3 * lc3x;
MX4 = m4 * lc4x;
MX5 = m5 * lc5x;
MX6 = m6 * lc6x;
MX7 = m7 * lc7x;

% MYi
MY1 = m1 * lc1y;
MY2 = m2 * lc2y;
MY3 = m3 * lc3y;
MY4 = m4 * lc4y;
MY5 = m5 * lc5y;
MY6 = m6 * lc6y;
MY7 = m7 * lc7y;

% MZi
MZ1 = m1 * lc1z;
MZ2 = m2 * lc2z;
MZ3 = m3 * lc3z;
MZ4 = m4 * lc4z;
MZ5 = m5 * lc5z;
MZ6 = m6 * lc6z;
MZ7 = m7 * lc7z;

% XXi
XX2 = I2xx + m2 * (lc2y^2 + lc2z^2);
XX3 = I3xx + m3 * (lc3y^2 + lc3z^2);
XX4 = I4xx + m4 * (lc4y^2 + lc4z^2);
XX5 = I5xx + m5 * (lc5y^2 + lc5z^2);
XX6 = I6xx + m6 * (lc6y^2 + lc6z^2);
XX7 = I7xx + m7 * (lc7y^2 + lc7z^2);

% XYi
XY2 = I2xy - m2 * lc2x * lc2y;
XY3 = I3xy - m3 * lc3x * lc3y;
XY4 = I4xy - m4 * lc4x * lc4y;
XY5 = I5xy - m5 * lc5x * lc5y;
XY6 = I6xy - m6 * lc6x * lc6y;
XY7 = I7xy - m7 * lc7x * lc7y;

%XZi
XZ2 = I2xz - m2 * lc2x * lc2z;
XZ3 = I3xz - m3 * lc3x * lc3z;
XZ4 = I4xz - m4 * lc4x * lc4z;
XZ5 = I5xz - m5 * lc5x * lc5z;
XZ6 = I6xz - m6 * lc6x * lc6z;
XZ7 = I7xz - m7 * lc7x * lc7z;

% YYi
YY2 = I2yy + m1 * (lc2x^2 + lc2z^2);
YY3 = I3yy + m1 * (lc3x^2 + lc3z^2);
YY4 = I4yy + m1 * (lc4x^2 + lc4z^2);
YY5 = I5yy + m1 * (lc5x^2 + lc5z^2);
YY6 = I6yy + m1 * (lc6x^2 + lc6z^2);
YY7 = I7yy + m1 * (lc7x^2 + lc7z^2);

%YZi
YZ2 = I2yz - m2 * lc2y * lc2z;
YZ3 = I3yz - m3 * lc3y * lc3z;
YZ4 = I4yz - m4 * lc4y * lc4z;
YZ5 = I5yz - m5 * lc5y * lc5z;
YZ6 = I6yz - m6 * lc6y * lc6z;
YZ7 = I7yz - m7 * lc7y * lc7z;

%ZZi
ZZ1 = I1zz + m1 * (lc1x^2 + lc1y^2);
ZZ2 = I2zz + m2 * (lc2x^2 + lc2y^2);
ZZ3 = I3zz + m3 * (lc3x^2 + lc3y^2);
ZZ4 = I4zz + m4 * (lc4x^2 + lc4y^2);
ZZ5 = I5zz + m5 * (lc5x^2 + lc5y^2);
ZZ6 = I6zz + m6 * (lc6x^2 + lc6y^2);
ZZ7 = I7zz + m7 * (lc7x^2 + lc7y^2);

ZZR1 = YY2 + ZZ1; 
MR6 = m6 + m7; 
MR5 = m5 + MR6; 
MR4 = m4 + MR5; 
MR3 = m3 + MR4; 
XXR2 = 0.155236 * MR3 + 0.788 * MZ3 + XX2 - YY2 + YY3;
ZZR2 = 0.155236 * MR3 + 0.788 * MZ3 + YY3 + ZZ2;
MYR2 = -0.394 * MR3 + MY2 - MZ3;
XXR3 = XX3 - YY3 + YY4;
ZZR3 = YY4 + ZZ3; 
MYR3 = MY3 + MZ4;
XXR4 = 0.133956 * MR5 + 0.732 * MZ5 + XX4 - YY4 + YY5;
ZZR4 = 0.133956 * MR5 + 0.732 * MZ5 + YY5 + ZZ4;
MYR4 = -0.366 * MR5 + MY4 - MZ5;
XXR5 = XX5 - YY5 + YY6;
ZZR5 = YY6 + ZZ5;
MYR5 = MY5 + MZ6;
XXR6 = 0.06265009 * m7 + 0.5006 * MZ7 + XX6 - YY6 + YY7;
ZZR6 = 0.06265009 * m7 + 0.5006 * MZ7 + YY7 + ZZ6;
MYR6 = -0.2503 * m7 + MY6 - MZ7;
XXR7 = XX7 - YY7;
ZZR7 = ZZ7;
MYR7 = MY7;

base_inertial_parameters = [ZZR1, ...
    XXR2, XY2, XZ2, YZ2, ZZR2, MX2, MYR2, ...
    XXR3, XY3, XZ3, YZ3, ZZR3, MX3, MYR3, ...
    XXR4, XY4, XZ4, YZ4, ZZR4, MX4, MYR4, ...
    XXR5, XY5, XZ5, YZ5, ZZR5, MX5, MYR5, ...
    XXR6, XY6, XZ6, YZ6, ZZR6, MX6, MYR6, ...
    XXR7, XY7, XZ7, YZ7, ZZR7, MX7, MYR7];

%% 计算回归矩阵；
[n_sample, ~] = size(qd_filt);
friction = zeros(n_sample * 7, 1);

for k = 1 : n_sample
    start_row = 1 + (k - 1) * 7;
    qd = qd_filt(k, :);

   for i = 1 : 7
        friction(start_row + (i - 1), 1) = sign(qd(i)) * (fc(i) + (fs(i) - fc(i)) * exp(-1 * abs(qd(i) / vs(i)) ^ gamma)) + fv(i) * qd(i) + bias(i);
   end
end
output = ww * base_inertial_parameters' + friction;
end
