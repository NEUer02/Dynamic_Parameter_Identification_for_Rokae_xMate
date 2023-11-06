function [base_inertial_parameters] = transform_parameters(parameters)
%% 参数解包
m1 = parameters(1);   m2 = parameters(2);   m3 = parameters(3);   m4 = parameters(4);   m5 = parameters(5);   m6 = parameters(6);   m7 = parameters(7);
MX1 = parameters(8);  MX2 = parameters(9);  MX3 = parameters(10); MX4 = parameters(11); MX5 = parameters(12); MX6 = parameters(13); MX7 = parameters(14);
MY1 = parameters(15); MY2 = parameters(16); MY3 = parameters(17); MY4 = parameters(18); MY5 = parameters(19); MY6 = parameters(20); MY7 = parameters(21);  
MZ1 = parameters(22); MZ2 = parameters(23); MZ3 = parameters(24); MZ4 = parameters(25); MZ5 = parameters(26); MZ6 = parameters(27); MZ7 = parameters(28);
I1xx = parameters(29); I1xy = parameters(30); I1xz = parameters(31); I1yy = parameters(32); I1yz = parameters(33); I1zz = parameters(34); lc1x = parameters(35); lc1y = parameters(36); lc1z = parameters(37);
I2xx = parameters(38); I2xy = parameters(39); I2xz = parameters(40); I2yy = parameters(41); I2yz = parameters(42); I2zz = parameters(43); lc2x = parameters(44); lc2y = parameters(45); lc2z = parameters(46);
I3xx = parameters(47); I3xy = parameters(48); I3xz = parameters(49); I3yy = parameters(50); I3yz = parameters(51); I3zz = parameters(52); lc3x = parameters(53); lc3y = parameters(54); lc3z = parameters(55);
I4xx = parameters(56); I4xy = parameters(57); I4xz = parameters(58); I4yy = parameters(59); I4yz = parameters(60); I4zz = parameters(61); lc4x = parameters(62); lc4y = parameters(63); lc4z = parameters(64);
I5xx = parameters(65); I5xy = parameters(66); I5xz = parameters(67); I5yy = parameters(68); I5yz = parameters(69); I5zz = parameters(70); lc5x = parameters(71); lc5y = parameters(72); lc5z = parameters(73);
I6xx = parameters(74); I6xy = parameters(75); I6xz = parameters(76); I6yy = parameters(77); I6yz = parameters(78); I6zz = parameters(79); lc6x = parameters(80); lc6y = parameters(81); lc6z = parameters(82);
I7xx = parameters(83); I7xy = parameters(84); I7xz = parameters(85); I7yy = parameters(86); I7yz = parameters(87); I7zz = parameters(88); lc7x = parameters(89); lc7y = parameters(90); lc7z = parameters(91);

%% 物理参数集和最小参数集之间的转换
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
end