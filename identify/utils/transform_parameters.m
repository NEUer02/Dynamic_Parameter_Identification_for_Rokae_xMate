function [base_inertial_parameters] = transform_parameters(parameters)
%% 参数解包
m1 = parameters(1);   m2 = parameters(2);   m3 = parameters(3);   m4 = parameters(4);   m5 = parameters(5);   m6 = parameters(6);   m7 = parameters(7);
I1xx = parameters(8); I1xy = parameters(9); I1xz = parameters(10); I1yy = parameters(11); I1yz = parameters(12); I1zz = parameters(13); lc1x = parameters(14); lc1y = parameters(15); lc1z = parameters(16);
I2xx = parameters(17); I2xy = parameters(18); I2xz = parameters(19); I2yy = parameters(20); I2yz = parameters(21); I2zz = parameters(22); lc2x = parameters(23); lc2y = parameters(24); lc2z = parameters(25);
I3xx = parameters(26); I3xy = parameters(27); I3xz = parameters(28); I3yy = parameters(29); I3yz = parameters(30); I3zz = parameters(31); lc3x = parameters(32); lc3y = parameters(33); lc3z = parameters(34);
I4xx = parameters(35); I4xy = parameters(36); I4xz = parameters(37); I4yy = parameters(38); I4yz = parameters(39); I4zz = parameters(40); lc4x = parameters(41); lc4y = parameters(42); lc4z = parameters(43);
I5xx = parameters(44); I5xy = parameters(45); I5xz = parameters(46); I5yy = parameters(47); I5yz = parameters(48); I5zz = parameters(49); lc5x = parameters(50); lc5y = parameters(51); lc5z = parameters(52);
I6xx = parameters(53); I6xy = parameters(54); I6xz = parameters(55); I6yy = parameters(56); I6yz = parameters(57); I6zz = parameters(58); lc6x = parameters(59); lc6y = parameters(60); lc6z = parameters(61);
I7xx = parameters(62); I7xy = parameters(63); I7xz = parameters(64); I7yy = parameters(65); I7yz = parameters(66); I7zz = parameters(67); lc7x = parameters(68); lc7y = parameters(69); lc7z = parameters(70);

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
XX1 = I1xx + m1 * (lc1y^2 + lc1z^2);
XX2 = I2xx + m2 * (lc2y^2 + lc2z^2);
XX3 = I3xx + m3 * (lc3y^2 + lc3z^2);
XX4 = I4xx + m4 * (lc4y^2 + lc4z^2);
XX5 = I5xx + m5 * (lc5y^2 + lc5z^2);
XX6 = I6xx + m6 * (lc6y^2 + lc6z^2);
XX7 = I7xx + m7 * (lc7y^2 + lc7z^2);

% XYi
XY1 = I1xy - m1 * lc1x * lc1y;
XY2 = I2xy - m2 * lc2x * lc2y;
XY3 = I3xy - m3 * lc3x * lc3y;
XY4 = I4xy - m4 * lc4x * lc4y;
XY5 = I5xy - m5 * lc5x * lc5y;
XY6 = I6xy - m6 * lc6x * lc6y;
XY7 = I7xy - m7 * lc7x * lc7y;

%XZi
XZ1 = I1xz - m1 * lc1x * lc1z;
XZ2 = I2xz - m2 * lc2x * lc2z;
XZ3 = I3xz - m3 * lc3x * lc3z;
XZ4 = I4xz - m4 * lc4x * lc4z;
XZ5 = I5xz - m5 * lc5x * lc5z;
XZ6 = I6xz - m6 * lc6x * lc6z;
XZ7 = I7xz - m7 * lc7x * lc7z;

% YYi
YY1 = I1yy + m1 * (lc1x^2 + lc1z^2);
YY2 = I2yy + m2 * (lc2x^2 + lc2z^2);
YY3 = I3yy + m3 * (lc3x^2 + lc3z^2);
YY4 = I4yy + m4 * (lc4x^2 + lc4z^2);
YY5 = I5yy + m5 * (lc5x^2 + lc5z^2);
YY6 = I6yy + m6 * (lc6x^2 + lc6z^2);
YY7 = I7yy + m7 * (lc7x^2 + lc7z^2);

%YZi
YZ1 = I1yz - m1 * lc1y * lc1z;
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

base_inertial_parameters = [
    m1, m2, m3, m4, m5, m6, m7, ...
    MX1, MX2, MX3, MX4, MX5, MX6, MX7, ...
    MY1, MY2, MY3, MY4, MY5, MY6, MY7, ...
    MZ1, MZ2, MZ3, MZ4, MZ5, MZ6, MZ7, ...
    XX1, XX2, XX3, XX4, XX5, XX6, XX7, ...
    XY1, XY2, XY3, XY4, XY5, XY6, XY7, ...
    XZ1, XZ2, XZ3, XZ4, XZ5, XZ6, XZ7, ...
    YY1, YY2, YY3, YY4, YY5, YY6, YY7, ...
    YZ1, YZ2, YZ3, YZ4, YZ5, YZ6, YZ7, ...
    ZZ1, ZZ2, ZZ3, ZZ4, ZZ5, ZZ6, ZZ7, ...
    ZZR1, ...
    XXR2, XY2, XZ2, YZ2, ZZR2, MX2, MYR2, ...
    XXR3, XY3, XZ3, YZ3, ZZR3, MX3, MYR3, ...
    XXR4, XY4, XZ4, YZ4, ZZR4, MX4, MYR4, ...
    XXR5, XY5, XZ5, YZ5, ZZR5, MX5, MYR5, ...
    XXR6, XY6, XZ6, YZ6, ZZR6, MX6, MYR6, ...
    XXR7, XY7, XZ7, YZ7, ZZR7, MX7, MYR7];
end