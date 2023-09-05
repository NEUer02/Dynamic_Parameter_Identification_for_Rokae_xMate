%% 物理参数集和最小参数集之间的转换
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
YY2 = I2yy + m1 * (lc2x^2 + lc2z^2);
YY3 = I3yy + m1 * (lc3x^2 + lc3z^2);
YY4 = I4yy + m1 * (lc4x^2 + lc4z^2);
YY5 = I5yy + m1 * (lc5x^2 + lc5z^2);
YY6 = I6yy + m1 * (lc6x^2 + lc6z^2);
YY7 = I7yy + m1 * (lc7x^2 + lc7z^2);

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

%% 
% eval(subs(, {''} ,{}));
ZZR1 = YY2 + ZZ1; 
eval(subs(ZZR1, {'YY2', 'ZZ1'}, {YY2, ZZ1}));
MR6 = m6 + m7; 
MR5 = m5 + MR6; eval(subs(MR5,{'MR6'} ,{MR6}));
MR4 = m4 + MR5; eval(subs(MR4,{'MR5'} ,{MR5}));
MR3 = m3 + MR4; eval(subs(MR3,{'MR4'} ,{MR4}));
XXR2 = 0.155236 * MR3 + 0.788 * MZ3 + XX2 - YY2 + YY3;
eval(subs(XXR2, {'MR3', 'XX2', 'YY2', 'YY3'} ,{MR3, XX2, YY2, YY3}));
ZZR2 = 0.155236 * MR3 + 0.788 * MZ3 + YY3 + ZZ2;
eval(subs(ZZR2, {'MR3', 'YY3', 'ZZ2'} ,{MR3, YY3, ZZ2}));
MYR2 = -0.394 * MR3 + MY2 - MZ3;
eval(subs(MY2, {'MR3'} ,{MR3}));
XXR3 = XX3 - YY3 + YY4;
eval(subs(XXR3, {'XX3', 'YY3', 'YY4'} ,{XX3, YY3, YY4}));
ZZR3 = YY4 + ZZ3; 
eval(subs(ZZR3, {'YY4', 'ZZ3'} ,{YY4, ZZ3}));
MYR3 = MY3 + MZ4;
XXR4 = 0.133956 * MR5 + 0.732 * MZ5 + XX4 - YY4 + YY5;
eval(subs(XXR4, {'MR5', 'XX4', 'YY4', 'YY5'} ,{MR5, XX4, YY4, YY5}));
ZZR4 = 0.133956 * MR5 + 0.732 * MZ5 + YY5 + ZZ4;
eval(subs(ZZR4,{'MR5', 'YY5', 'ZZ4'} ,{MR5, YY5, ZZ4}));
MYR4 = -0.366 * MR5 + MY4 - MZ5;
eval(subs(MYR4, {'MR5'} ,{MR5}));
XXR5 = XX5 - YY5 + YY6;
eval(subs(XXR5, {'XX5', 'YY5', 'YY6'} ,{XX5, YY5, YY6}));
ZZR5 = YY6 + ZZ5;
eval(subs(ZZR5, {'YY6', 'ZZ5'} ,{YY6, ZZ5}));
MYR5 = MY5 + MZ6;
XXR6 = 0.06265009 * m7 + 0.5006 * MZ7 + XX6 - YY6 + YY7;
eval(subs(XXR6, {'XX6', 'YY6', 'YY7'} ,{XX6, YY6, YY7}));
ZZR6 = 0.06265009 * m7 + 0.5006 * MZ7 + YY7 + ZZ6;
eval(subs(ZZR6, {'YY7', 'ZZ6'} ,{YY7, ZZ6}));
MYR6 = -0.2503 * m7 + MY6 - MZ7;
XXR7 = XX7 - YY7;
eval(subs(XXR7, {'XX7', 'YY7'} ,{XX7, YY7}));
ZZR7 = ZZ7;
eval(subs(ZZR7, {'ZZ7'} ,{ZZ7}));
MYR7 = MY7;
