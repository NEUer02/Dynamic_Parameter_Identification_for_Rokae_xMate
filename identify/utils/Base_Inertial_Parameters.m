C1 = cos(th1);
S1 = sin(th1);
C2 = cos(th2);
S2 = sin(th2);
C3 = cos(th3);
S3 = sin(th3);
C4 = cos(th4);
S4 = sin(th4);
C5 = cos(th5);
S5 = sin(th5);
C6 = cos(th6);
S6 = sin(th6);
C7 = cos(th7);
S7 = sin(th7);
LamMS217 = 0.2503*C7;
LamMS517 = 0.2503*S7;
XXR7 = XX7 - YY7;
MR6 = M6 + M7;
XXR6 = 0.06265009*M7 + 0.5006*MZ7 + XX6 - YY6 + YY7;
ZZR6 = 0.06265009*M7 + 0.5006*MZ7 + YY7 + ZZ6;
MYR6 = -0.2503*M7 + MY6 - MZ7;
LamMS215 = 0.366*C5;
LamMS515 = 0.366*S5;
MR5 = M5 + MR6;
XXR5 = XX5 - YY5 + YY6;
ZZR5 = YY6 + ZZ5;
MYR5 = MY5 + MZ6;
MR4 = M4 + MR5;
XXR4 = 0.133956*MR5 + 0.732*MZ5 + XX4 - YY4 + YY5;
ZZR4 = 0.133956*MR5 + 0.732*MZ5 + YY5 + ZZ4;
MYR4 = -0.366*MR5 + MY4 - MZ5;
LamMS213 = 0.394*C3;
LamMS513 = 0.394*S3;
MR3 = M3 + MR4;
XXR3 = XX3 - YY3 + YY4;
ZZR3 = YY4 + ZZ3;
MYR3 = MY3 + MZ4;
MR2 = M2 + MR3;
XXR2 = 0.155236*MR3 + 0.788*MZ3 + XX2 - YY2 + YY3;
ZZR2 = 0.155236*MR3 + 0.788*MZ3 + YY3 + ZZ2;
MYR2 = -0.394*MR3 + MY2 - MZ3;
LamMS311 = -0.3415*C1;
LamMS511 = -0.3415*S1;
MR1 = M1 + MR2;
ZZR1 = YY2 + ZZ1;

% Dynamic inertia parameters
% j       XX      XY      XZ      YY      YZ      ZZ      MX      MY      MZ      M       IA      
% 1       0       0       0       0       0       ZZR1    0       0       0       0       0       
% 2       XXR2    XY2     XZ2     0       YZ2     ZZR2    MX2     MYR2    0       0       0       
% 3       XXR3    XY3     XZ3     0       YZ3     ZZR3    MX3     MYR3    0       0       0       
% 4       XXR4    XY4     XZ4     0       YZ4     ZZR4    MX4     MYR4    0       0       0       
% 5       XXR5    XY5     XZ5     0       YZ5     ZZR5    MX5     MYR5    0       0       0       
% 6       XXR6    XY6     XZ6     0       YZ6     ZZR6    MX6     MYR6    0       0       0       
% 7       XXR7    XY7     XZ7     0       YZ7     ZZ7     MX7     MY7     0       0       0       
