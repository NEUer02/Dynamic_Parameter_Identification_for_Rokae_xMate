%% 动力学模型物理参数集
syms m1 m2 m3 m4 m5 m6 m7 real;
syms MX1 MX2 MX3 MX4 MX5 MX6 MX7 real; 
syms MY1 MY2 MY3 MY4 MY5 MY6 MY7 real; 
syms MZ1 MZ2 MZ3 MZ4 MZ5 MZ6 MZ7 real; 
syms I1xx I1xy I1xz I1yy I1yz I1zz lc1x lc1y lc1z real;
syms I2xx I2xy I2xz I2yy I2yz I2zz lc2x lc2y lc2z real;
syms I3xx I3xy I3xz I3yy I3yz I3zz lc3x lc3y lc3z real;
syms I4xx I4xy I4xz I4yy I4yz I4zz lc4x lc4y lc4z real;
syms I5xx I5xy I5xz I5yy I5yz I5zz lc5x lc5y lc5z real;
syms I6xx I6xy I6xz I6yy I6yz I6zz lc6x lc6y lc6z real;
syms I7xx I7xy I7xz I7yy I7yz I7zz lc7x lc7y lc7z real;

%% 逆动力学模型最小参数集
syms ZZR1 XXR2 XY2 XZ2 YZ2 ZZR2 MYR2 XXR3 XY3 XZ3 YZ3 ZZR3 MYR3 XXR4 XY4 XZ4 YZ4 ZZR4 MYR4 XXR5 XY5 XZ5 YZ5 ZZR5 MYR5 XXR6 XY6 XZ6 YZ6 ZZR6 MYR6 XXR7 XY7 XZ7 YZ7 ZZR7 MYR7 real;
dynamic_model_parameters = [ZZR1 XXR2 XY2 XZ2 YZ2 ZZR2 MX2 MYR2 XXR3 XY3 XZ3 YZ3 ZZR3 MX3 MYR3 XXR4 XY4 XZ4 YZ4 ZZR4 MX4 MYR4 XXR5 XY5 XZ5 YZ5 ZZR5 MX5 MYR5 XXR6 XY6 XZ6 YZ6 ZZR6 MX6 MYR6 XXR7 XY7 XZ7 YZ7 ZZR7 MX7 MYR7]';

%% 机械臂关节参数
syms th1 th2 th3 th4 th5 th6 th7 real;
syms QP1 QDP1 QP2 QDP2 QP3 QDP3 QP4 QDP4 QP5 QDP5 QP6 QDP6 QP7 QDP7 real;
syms g real;

%% Stribeck摩擦力模型
syms fc1 fs1 vs1 fv1 real;
syms fc2 fs2 vs2 fv2 real;
syms fc3 fs3 vs3 fv3 real;
syms fc4 fs4 vs4 fv4 real;
syms fc5 fs5 vs5 fv5 real;
syms fc6 fs6 vs6 fv6 real;
syms fc7 fs7 vs7 fv7 real;
