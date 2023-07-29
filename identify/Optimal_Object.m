base_inertial_parameters = [ZZR1; 
    XXR2; XY2; XZ2; YZ2; ZZR2; MX2; MYR2;
    XXR3; XY3; XZ3; YZ3; ZZR3; MX3; MYR3;
    XXR4; XY4; XZ4; YZ4; ZZR4; MX4; MYR4;
    XXR5; XY5; XZ5; YZ5; ZZR5; MX5; MYR5;
    XXR6; XY6; XZ6; YZ6; ZZR6; MX6; MYR6;
    XXR7; XY7; XZ7; YZ7; ZZR7; MX7; MYR7;];

regression_matrix = [
%ZZR1 XXR2   XY2     XZ2     YZ2     ZZR2   MX2  MYR2  XXR3   XY3     XZ3     YZ3     ZZR3   MX3    MYR3   XXR4   XY4     XZ4     YZ4     ZZR4   MX4    MYR4    XXR5   XY5     XZ5     YZ5     ZZR5   MX5    MYR5   XXR6   XY6     XZ6     YZ6     ZZR6   MX6    MYR6    XXR7   XY7     XZ7     YZ7     ZZR7   MX7    MYR7   FS1       FV1 FS2       FV2 FS3       FV3 FS4       FV4 FS5       FV5 FS6       FV6 FS7       FV7 
 QDP1 N13XX2 N13XY2  N13XZ2  N13YZ2  N13ZZ2 0    0     N13XX3 N13XY3  N13XZ3  N13YZ3  N13ZZ3 N13MX3 N13MY3 N13XX4 N13XY4  N13XZ4  N13YZ4  N13ZZ4 N13MX4 N13MY4  N13XX5 N13XY5  N13XZ5  N13YZ5  N13ZZ5 N13MX5 N13MY5 N13XX6 N13XY6  N13XZ6  N13YZ6  N13ZZ6 N13MX6 N13MY6  N13XX7 N13XY7  N13XZ7  N13YZ7  N13ZZ7 N13MX7 N13MY7 sign(QP1) QP1 0         0   0         0   0         0   0         0   0         0   0         0  ;% 1
 0    -DV22  No23XY2 No23XZ2 No23YZ2 QDP2   VP22 -VP12 N23XX3 N23XY3  N23XZ3  N23YZ3  N23ZZ3 N23MX3 N23MY3 N23XX4 N23XY4  N23XZ4  N23YZ4  N23ZZ4 N23MX4 N23MY4  N23XX5 N23XY5  N23XZ5  N23YZ5  N23ZZ5 N23MX5 N23MY5 N23XX6 N23XY6  N23XZ6  N23YZ6  N23ZZ6 N23MX6 N23MY6  N23XX7 N23XY7  N23XZ7  N23YZ7  N23ZZ7 N23MX7 N23MY7 0         0   sign(QP2) QP2 0         0   0         0   0         0   0         0   0         0  ;% 2
 0    0      0       0       0       0      0    0     -DV23  No33XY3 No33XZ3 No33YZ3 WP33   VP23   -VP13  N33XX4 N33XY4  N33XZ4  N33YZ4  N33ZZ4 N33MX4 -N31MX4 N33XX5 N33XY5  N33XZ5  N33YZ5  N33ZZ5 N33MX5 N33MY5 N33XX6 N33XY6  N33XZ6  N33YZ6  N33ZZ6 N33MX6 N33MY6  N33XX7 N33XY7  N33XZ7  N33YZ7  N33ZZ7 N33MX7 N33MY7 0         0   0         0   sign(QP3) QP3 0         0   0         0   0         0   0         0  ;% 3
 0    0      0       0       0       0      0    0     0      0       0       0       0      0      0      -DV24  No43XY4 No43XZ4 No43YZ4 WP34   VP24   -VP14   N43XX5 N43XY5  N43XZ5  N43YZ5  N43ZZ5 N43MX5 N43MY5 N43XX6 N43XY6  N43XZ6  N43YZ6  N43ZZ6 N43MX6 N43MY6  N43XX7 N43XY7  N43XZ7  N43YZ7  N43ZZ7 N43MX7 N43MY7 0         0   0         0   0         0   sign(QP4) QP4 0         0   0         0   0         0  ;% 4
 0    0      0       0       0       0      0    0     0      0       0       0       0      0      0      0      0       0       0       0      0      0       -DV25  No53XY5 No53XZ5 No53YZ5 WP35   VP25   -VP15  N53XX6 N53XY6  N53XZ6  N53YZ6  N53ZZ6 N53MX6 -N51MX6 N53XX7 N53XY7  N53XZ7  N53YZ7  N53ZZ7 N53MX7 N53MY7 0         0   0         0   0         0   0         0   sign(QP5) QP5 0         0   0         0  ;% 5
 0    0      0       0       0       0      0    0     0      0       0       0       0      0      0      0      0       0       0       0      0      0       0      0       0       0       0      0      0      -DV26  No63XY6 No63XZ6 No63YZ6 WP36   VP26   -VP16   N63XX7 N63XY7  N63XZ7  N63YZ7  N63ZZ7 N63MX7 N63MY7 0         0   0         0   0         0   0         0   0         0   sign(QP6) QP6 0         0  ;% 6
 0    0      0       0       0       0      0    0     0      0       0       0       0      0      0      0      0       0       0       0      0      0       0      0       0       0       0      0      0      0      0       0       0       0      0      0       -DV27  No73XY7 No73XZ7 No73YZ7 WP37   VP27   -VP17  0         0   0         0   0         0   0         0   0         0   0         0   sign(QP7) QP7;% 7
 ];

GAM = [GAM1; GAM2; GAM3; GAM4; GAM5; GAM6; GAM7];

% % 计算力矩与回归矩阵和最小辨识参数集的差的二范数的平方
% optimal_object = norm(GAM - regression_matrix * base_inertial_parameters)^2;
