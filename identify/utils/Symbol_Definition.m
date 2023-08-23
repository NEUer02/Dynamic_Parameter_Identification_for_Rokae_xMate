%% 逆动力学模型
syms th1 th2 th3 th4 th5 th6 th7;
syms QP1 QDP1 QP2 QDP2 QP3 QDP3 QP4 QDP4 QP5 QDP5 QP6 QDP6 QP7 QDP7;
syms g;

% syms M1 MX1 MY1 MZ1 XZ1 YZ1 ZZ1 M2 MX2 MY2 MZ2 XZ2 YZ2 ZZ2;
% syms M3 MX3 MY3 MZ3 XZ3 YZ3 ZZ3 M4 MX4 MY4 MZ4 XZ4 YZ4 ZZ4;
% syms M5 MX5 MY5 MZ5 XZ5 YZ5 ZZ5 M6 MX6 MY6 MZ6 XZ6 YZ6 ZZ6;
% syms M7 MX7 MY7 MZ7 XZ7 YZ7 ZZ7;
% 
% syms XX2 XY2 YY2 XX3 XY3 YY3 XX4 XY4 YY4 XX5 XY5 YY5 XX6 XY6 YY6 XX7 XY7 YY7;
% 
% syms FS1 FV1 FS2 FV2 FS3 FV3 FS4 FV4 FS5 FV5 FS6 FV6 FS7 FV7;
% 
% %% 最小辨识参数集
% syms ZZR7 MYR7;
% 
% %% 激励轨迹
% syms omega t;
% syms a11 b11 a12 b12 a13 b13 a14 b14 a15 b15;
% syms a21 b21 a22 b22 a23 b23 a24 b24 a25 b25;
% syms a31 b31 a32 b32 a33 b33 a34 b34 a35 b35;
% syms a41 b41 a42 b42 a43 b43 a44 b44 a45 b45;
% syms a51 b51 a52 b52 a53 b53 a54 b54 a55 b55;
% syms a61 b61 a62 b62 a63 b63 a64 b64 a65 b65;
% syms a71 b71 a72 b72 a73 b73 a74 b74 a75 b75;
