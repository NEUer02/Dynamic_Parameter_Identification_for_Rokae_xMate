function [regression_matrix] = compute_regression_matrix(q, qd, qdd, friction_model)
if(~exist('friction_model','var'))
    friction_model = 1;  % 如果未出现该变量，则对其进行赋值
end

g = 9.80665;

QP1 = qd(1); QDP1 = qdd(1);
th2 = q(2); QP2 = qd(2); QDP2 = qdd(2);
th3 = q(3); QP3 = qd(3); QDP3 = qdd(3);
th4 = q(4); QP4 = qd(4); QDP4 = qdd(4);
th5 = q(5); QP5 = qd(5); QDP5 = qdd(5);
th6 = q(6); QP6 = qd(6); QDP6 = qdd(6);
th7 = q(7); QP7 = qd(7); QDP7 = qdd(7);

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
W12 = -QP1*S2;
W22 = -C2*QP1;
WP12 = -QDP1*S2 + QP2*W22;
WP22 = -C2*QDP1 - QP2*W12;
DV12 = W12^2;
DV22 = W12*W22;
DV32 = QP2*W12;
DV52 = QP2*W22;
DV62 = QP2^2;
U122 = DV22 - QDP2;
U222 = -DV12 - DV62;
U322 = DV52 + WP12;
VP12 = -S2*g;
VP22 = -C2*g;
W13 = C3*W12 + QP2*S3;
W23 = C3*QP2 - S3*W12;
W33 = QP3 - W22;
WP13 = C3*WP12 + QDP2*S3 + QP3*W23;
WP23 = C3*QDP2 - QP3*W13 - S3*WP12;
WP33 = QDP3 - WP22;
DV13 = W13^2;
DV23 = W13*W23;
DV33 = W13*W33;
DV43 = W23^2;
DV53 = W23*W33;
DV63 = W33^2;
U113 = -DV43 - DV63;
U213 = DV23 + WP33;
U123 = DV23 - WP33;
U223 = -DV13 - DV63;
VSP13 = -0.394*U122 + VP12;
VSP23 = -0.394*U222 + VP22;
VSP33 = -0.394*U322;
VP13 = C3*VSP13 + S3*VSP33;
VP23 = C3*VSP33 - S3*VSP13;
W14 = C4*W13 - S4*W33;
W24 = -C4*W33 - S4*W13;
W34 = QP4 + W23;
WP14 = C4*WP13 + QP4*W24 - S4*WP33;
WP24 = -C4*WP33 - QP4*W14 - S4*WP13;
WP34 = QDP4 + WP23;
DV14 = W14^2;
DV24 = W14*W24;
DV34 = W14*W34;
DV44 = W24^2;
DV54 = W24*W34;
DV64 = W34^2;
U114 = -DV44 - DV64;
U214 = DV24 + WP34;
U314 = DV34 - WP24;
U124 = DV24 - WP34;
U224 = -DV14 - DV64;
U324 = DV54 + WP14;
VP14 = C4*VP13 + S4*VSP23;
VP24 = C4*VSP23 - S4*VP13;
W15 = C5*W14 + S5*W34;
W25 = C5*W34 - S5*W14;
W35 = QP5 - W24;
WP15 = C5*WP14 + QP5*W25 + S5*WP34;
WP25 = C5*WP34 - QP5*W15 - S5*WP14;
WP35 = QDP5 - WP24;
DV15 = W15^2;
DV25 = W15*W25;
DV35 = W15*W35;
DV45 = W25^2;
DV55 = W25*W35;
DV65 = W35^2;
U115 = -DV45 - DV65;
U215 = DV25 + WP35;
U315 = DV35 - WP25;
U125 = DV25 - WP35;
U225 = -DV15 - DV65;
U325 = DV55 + WP15;
VSP15 = -0.366*U124 + VP14;
VSP25 = -0.366*U224 + VP24;
VSP35 = -0.366*U324 + VP23;
VP15 = C5*VSP15 + S5*VSP35;
VP25 = C5*VSP35 - S5*VSP15;
W16 = C6*W15 - S6*W35;
W26 = -C6*W35 - S6*W15;
W36 = QP6 + W25;
WP16 = C6*WP15 + QP6*W26 - S6*WP35;
WP26 = -C6*WP35 - QP6*W16 - S6*WP15;
WP36 = QDP6 + WP25;
DV16 = W16^2;
DV26 = W16*W26;
DV36 = W16*W36;
DV46 = W26^2;
DV56 = W26*W36;
DV66 = W36^2;
U116 = -DV46 - DV66;
U216 = DV26 + WP36;
U316 = DV36 - WP26;
U126 = DV26 - WP36;
U226 = -DV16 - DV66;
U326 = DV56 + WP16;
VP16 = C6*VP15 + S6*VSP25;
VP26 = C6*VSP25 - S6*VP15;
W17 = C7*W16 + S7*W36;
W27 = C7*W36 - S7*W16;
W37 = QP7 - W26;
WP17 = C7*WP16 + QP7*W27 + S7*WP36;
WP27 = C7*WP36 - QP7*W17 - S7*WP16;
WP37 = QDP7 - WP26;
DV17 = W17^2;
DV27 = W17*W27;
DV37 = W17*W37;
DV47 = W27^2;
DV57 = W27*W37;
DV67 = W37^2;
U117 = -DV47 - DV67;
U217 = DV27 + WP37;
U317 = DV37 - WP27;
U127 = DV27 - WP37;
U227 = -DV17 - DV67;
U327 = DV57 + WP17;
VSP17 = -0.2503*U126 + VP16;
VSP27 = -0.2503*U226 + VP26;
VSP37 = -0.2503*U326 + VP25;
VP17 = C7*VSP17 + S7*VSP37;
VP27 = C7*VSP37 - S7*VSP17;
N13XX2 = -C2*DV32 - S2*WP12;
No21XY2 = -QP2*W12 + WP22;
No22XY2 = QP2*W22 + WP12;
No23XY2 = W12^2 - W22^2;
N13XY2 = -C2*No22XY2 - No21XY2*S2;
No21XZ2 = QDP2 + W12*W22;
No22XZ2 = QP2^2 - W12^2;
No23XZ2 = -QP2*W22 + WP12;
N13XZ2 = -C2*No22XZ2 - No21XZ2*S2;
No21YZ2 = -QP2^2 + W22^2;
No22YZ2 = QDP2 - W12*W22;
No23YZ2 = QP2*W12 + WP22;
N13YZ2 = -C2*No22YZ2 - No21YZ2*S2;
N13ZZ2 = C2*DV32 - DV52*S2;
N21XX3 = C3*WP13 - DV33*S3;
N23XX3 = C3*DV33 + S3*WP13;
N13XX3 = -C2*DV23 - N21XX3*S2;
No31XY3 = -W13*W33 + WP23;
No32XY3 = W23*W33 + WP13;
No33XY3 = W13^2 - W23^2;
N21XY3 = C3*No31XY3 - No32XY3*S3;
N23XY3 = C3*No32XY3 + No31XY3*S3;
N13XY3 = C2*No33XY3 - N21XY3*S2;
No31XZ3 = W13*W23 + WP33;
No32XZ3 = -W13^2 + W33^2;
No33XZ3 = -W23*W33 + WP13;
N21XZ3 = C3*No31XZ3 - No32XZ3*S3;
N23XZ3 = C3*No32XZ3 + No31XZ3*S3;
N13XZ3 = C2*No33XZ3 - N21XZ3*S2;
No31YZ3 = W23^2 - W33^2;
No32YZ3 = -W13*W23 + WP33;
No33YZ3 = W13*W33 + WP23;
N21YZ3 = C3*No31YZ3 - No32YZ3*S3;
N23YZ3 = C3*No32YZ3 + No31YZ3*S3;
N13YZ3 = C2*No33YZ3 - N21YZ3*S2;
N21ZZ3 = C3*DV53 + DV33*S3;
N23ZZ3 = -C3*DV33 + DV53*S3;
N13ZZ3 = C2*WP33 - N21ZZ3*S2;
FDI31MX3 = C3*U113 - S3*U213;
FDI33MX3 = C3*U213 + S3*U113;
N21MX3 = -0.394*FDI33MX3 - S3*VSP23;
N23MX3 = C3*VSP23 + 0.394*FDI31MX3;
N13MX3 = C2*VP23 - N21MX3*S2;
FDI31MY3 = C3*U123 - S3*U223;
FDI33MY3 = C3*U223 + S3*U123;
N21MY3 = -C3*VSP23 - 0.394*FDI33MY3;
N23MY3 = 0.394*FDI31MY3 - S3*VSP23;
N13MY3 = -C2*VP13 - N21MY3*S2;
N31XX4 = C4*WP14 - DV34*S4;
N33XX4 = -C4*DV34 - S4*WP14;
N21XX4 = C3*N31XX4 + DV24*S3;
N23XX4 = -C3*DV24 + N31XX4*S3;
N13XX4 = C2*N33XX4 - N21XX4*S2;
No41XY4 = -W14*W34 + WP24;
No42XY4 = W24*W34 + WP14;
No43XY4 = W14^2 - W24^2;
N31XY4 = C4*No41XY4 - No42XY4*S4;
N33XY4 = -C4*No42XY4 - No41XY4*S4;
N21XY4 = C3*N31XY4 - No43XY4*S3;
N23XY4 = C3*No43XY4 + N31XY4*S3;
N13XY4 = C2*N33XY4 - N21XY4*S2;
No41XZ4 = W14*W24 + WP34;
No42XZ4 = -W14^2 + W34^2;
No43XZ4 = -W24*W34 + WP14;
N31XZ4 = C4*No41XZ4 - No42XZ4*S4;
N33XZ4 = -C4*No42XZ4 - No41XZ4*S4;
N21XZ4 = C3*N31XZ4 - No43XZ4*S3;
N23XZ4 = C3*No43XZ4 + N31XZ4*S3;
N13XZ4 = C2*N33XZ4 - N21XZ4*S2;
No41YZ4 = W24^2 - W34^2;
No42YZ4 = -W14*W24 + WP34;
No43YZ4 = W14*W34 + WP24;
N31YZ4 = C4*No41YZ4 - No42YZ4*S4;
N33YZ4 = -C4*No42YZ4 - No41YZ4*S4;
N21YZ4 = C3*N31YZ4 - No43YZ4*S3;
N23YZ4 = C3*No43YZ4 + N31YZ4*S3;
N13YZ4 = C2*N33YZ4 - N21YZ4*S2;
N31ZZ4 = C4*DV54 + DV34*S4;
N33ZZ4 = C4*DV34 - DV54*S4;
N21ZZ4 = C3*N31ZZ4 - S3*WP34;
N23ZZ4 = C3*WP34 + N31ZZ4*S3;
N13ZZ4 = C2*N33ZZ4 - N21ZZ4*S2;
FDI41MX4 = C4*U114 - S4*U214;
N31MX4 = S4*VP23;
N33MX4 = C4*VP23;
FDI31MX4 = C3*FDI41MX4 - S3*U314;
FDI33MX4 = C3*U314 + FDI41MX4*S3;
N21MX4 = C3*N31MX4 - 0.394*FDI33MX4 - S3*VP24;
N23MX4 = C3*VP24 + 0.394*FDI31MX4 + N31MX4*S3;
N13MX4 = C2*N33MX4 - N21MX4*S2;
FDI41MY4 = C4*U124 - S4*U224;
FDI31MY4 = C3*FDI41MY4 - S3*U324;
FDI33MY4 = C3*U324 + FDI41MY4*S3;
N21MY4 = C3*N33MX4 - 0.394*FDI33MY4 + S3*VP14;
N23MY4 = -C3*VP14 + 0.394*FDI31MY4 + N33MX4*S3;
N13MY4 = -C2*N31MX4 - N21MY4*S2;
N41XX5 = C5*WP15 - DV35*S5;
N43XX5 = C5*DV35 + S5*WP15;
N31XX5 = C4*N41XX5 - DV25*S4;
N33XX5 = -C4*DV25 - N41XX5*S4;
N21XX5 = C3*N31XX5 - N43XX5*S3;
N23XX5 = C3*N43XX5 + N31XX5*S3;
N13XX5 = C2*N33XX5 - N21XX5*S2;
No51XY5 = -W15*W35 + WP25;
No52XY5 = W25*W35 + WP15;
No53XY5 = W15^2 - W25^2;
N41XY5 = C5*No51XY5 - No52XY5*S5;
N43XY5 = C5*No52XY5 + No51XY5*S5;
N31XY5 = C4*N41XY5 + No53XY5*S4;
N33XY5 = C4*No53XY5 - N41XY5*S4;
N21XY5 = C3*N31XY5 - N43XY5*S3;
N23XY5 = C3*N43XY5 + N31XY5*S3;
N13XY5 = C2*N33XY5 - N21XY5*S2;
No51XZ5 = W15*W25 + WP35;
No52XZ5 = -W15^2 + W35^2;
No53XZ5 = -W25*W35 + WP15;
N41XZ5 = C5*No51XZ5 - No52XZ5*S5;
N43XZ5 = C5*No52XZ5 + No51XZ5*S5;
N31XZ5 = C4*N41XZ5 + No53XZ5*S4;
N33XZ5 = C4*No53XZ5 - N41XZ5*S4;
N21XZ5 = C3*N31XZ5 - N43XZ5*S3;
N23XZ5 = C3*N43XZ5 + N31XZ5*S3;
N13XZ5 = C2*N33XZ5 - N21XZ5*S2;
No51YZ5 = W25^2 - W35^2;
No52YZ5 = -W15*W25 + WP35;
No53YZ5 = W15*W35 + WP25;
N41YZ5 = C5*No51YZ5 - No52YZ5*S5;
N43YZ5 = C5*No52YZ5 + No51YZ5*S5;
N31YZ5 = C4*N41YZ5 + No53YZ5*S4;
N33YZ5 = C4*No53YZ5 - N41YZ5*S4;
N21YZ5 = C3*N31YZ5 - N43YZ5*S3;
N23YZ5 = C3*N43YZ5 + N31YZ5*S3;
N13YZ5 = C2*N33YZ5 - N21YZ5*S2;
N41ZZ5 = C5*DV55 + DV35*S5;
N43ZZ5 = -C5*DV35 + DV55*S5;
N31ZZ5 = C4*N41ZZ5 + S4*WP35;
N33ZZ5 = C4*WP35 - N41ZZ5*S4;
N21ZZ5 = C3*N31ZZ5 - N43ZZ5*S3;
N23ZZ5 = C3*N43ZZ5 + N31ZZ5*S3;
N13ZZ5 = C2*N33ZZ5 - N21ZZ5*S2;
FDI51MX5 = C5*U115 - S5*U215;
FDI53MX5 = C5*U215 + S5*U115;
N41MX5 = -0.366*FDI53MX5 - S5*VSP25;
N43MX5 = C5*VSP25 + 0.366*FDI51MX5;
FDI41MX5 = C4*FDI51MX5 + S4*U315;
N31MX5 = C4*N41MX5 + S4*VP25;
N33MX5 = C4*VP25 - N41MX5*S4;
FDI31MX5 = C3*FDI41MX5 - FDI53MX5*S3;
FDI33MX5 = C3*FDI53MX5 + FDI41MX5*S3;
N21MX5 = C3*N31MX5 - 0.394*FDI33MX5 - N43MX5*S3;
N23MX5 = C3*N43MX5 + 0.394*FDI31MX5 + N31MX5*S3;
N13MX5 = C2*N33MX5 - N21MX5*S2;
FDI51MY5 = C5*U125 - S5*U225;
FDI53MY5 = C5*U225 + S5*U125;
N41MY5 = -C5*VSP25 - 0.366*FDI53MY5;
N43MY5 = 0.366*FDI51MY5 - S5*VSP25;
FDI41MY5 = C4*FDI51MY5 + S4*U325;
N31MY5 = C4*N41MY5 - S4*VP15;
N33MY5 = -C4*VP15 - N41MY5*S4;
FDI31MY5 = C3*FDI41MY5 - FDI53MY5*S3;
FDI33MY5 = C3*FDI53MY5 + FDI41MY5*S3;
N21MY5 = C3*N31MY5 - 0.394*FDI33MY5 - N43MY5*S3;
N23MY5 = C3*N43MY5 + 0.394*FDI31MY5 + N31MY5*S3;
N13MY5 = C2*N33MY5 - N21MY5*S2;
N51XX6 = C6*WP16 - DV36*S6;
N53XX6 = -C6*DV36 - S6*WP16;
N41XX6 = C5*N51XX6 + DV26*S5;
N43XX6 = -C5*DV26 + N51XX6*S5;
N31XX6 = C4*N41XX6 + N53XX6*S4;
N33XX6 = C4*N53XX6 - N41XX6*S4;
N21XX6 = C3*N31XX6 - N43XX6*S3;
N23XX6 = C3*N43XX6 + N31XX6*S3;
N13XX6 = C2*N33XX6 - N21XX6*S2;
No61XY6 = -W16*W36 + WP26;
No62XY6 = W26*W36 + WP16;
No63XY6 = W16^2 - W26^2;
N51XY6 = C6*No61XY6 - No62XY6*S6;
N53XY6 = -C6*No62XY6 - No61XY6*S6;
N41XY6 = C5*N51XY6 - No63XY6*S5;
N43XY6 = C5*No63XY6 + N51XY6*S5;
N31XY6 = C4*N41XY6 + N53XY6*S4;
N33XY6 = C4*N53XY6 - N41XY6*S4;
N21XY6 = C3*N31XY6 - N43XY6*S3;
N23XY6 = C3*N43XY6 + N31XY6*S3;
N13XY6 = C2*N33XY6 - N21XY6*S2;
No61XZ6 = W16*W26 + WP36;
No62XZ6 = -W16^2 + W36^2;
No63XZ6 = -W26*W36 + WP16;
N51XZ6 = C6*No61XZ6 - No62XZ6*S6;
N53XZ6 = -C6*No62XZ6 - No61XZ6*S6;
N41XZ6 = C5*N51XZ6 - No63XZ6*S5;
N43XZ6 = C5*No63XZ6 + N51XZ6*S5;
N31XZ6 = C4*N41XZ6 + N53XZ6*S4;
N33XZ6 = C4*N53XZ6 - N41XZ6*S4;
N21XZ6 = C3*N31XZ6 - N43XZ6*S3;
N23XZ6 = C3*N43XZ6 + N31XZ6*S3;
N13XZ6 = C2*N33XZ6 - N21XZ6*S2;
No61YZ6 = W26^2 - W36^2;
No62YZ6 = -W16*W26 + WP36;
No63YZ6 = W16*W36 + WP26;
N51YZ6 = C6*No61YZ6 - No62YZ6*S6;
N53YZ6 = -C6*No62YZ6 - No61YZ6*S6;
N41YZ6 = C5*N51YZ6 - No63YZ6*S5;
N43YZ6 = C5*No63YZ6 + N51YZ6*S5;
N31YZ6 = C4*N41YZ6 + N53YZ6*S4;
N33YZ6 = C4*N53YZ6 - N41YZ6*S4;
N21YZ6 = C3*N31YZ6 - N43YZ6*S3;
N23YZ6 = C3*N43YZ6 + N31YZ6*S3;
N13YZ6 = C2*N33YZ6 - N21YZ6*S2;
N51ZZ6 = C6*DV56 + DV36*S6;
N53ZZ6 = C6*DV36 - DV56*S6;
N41ZZ6 = C5*N51ZZ6 - S5*WP36;
N43ZZ6 = C5*WP36 + N51ZZ6*S5;
N31ZZ6 = C4*N41ZZ6 + N53ZZ6*S4;
N33ZZ6 = C4*N53ZZ6 - N41ZZ6*S4;
N21ZZ6 = C3*N31ZZ6 - N43ZZ6*S3;
N23ZZ6 = C3*N43ZZ6 + N31ZZ6*S3;
N13ZZ6 = C2*N33ZZ6 - N21ZZ6*S2;
FDI61MX6 = C6*U116 - S6*U216;
FDI63MX6 = -C6*U216 - S6*U116;
N51MX6 = S6*VP25;
N53MX6 = C6*VP25;
FDI51MX6 = C5*FDI61MX6 - S5*U316;
FDI53MX6 = C5*U316 + FDI61MX6*S5;
N41MX6 = C5*N51MX6 - 0.366*FDI53MX6 - S5*VP26;
N43MX6 = C5*VP26 + 0.366*FDI51MX6 + N51MX6*S5;
FDI41MX6 = C4*FDI51MX6 + FDI63MX6*S4;
N31MX6 = C4*N41MX6 + N53MX6*S4;
N33MX6 = C4*N53MX6 - N41MX6*S4;
FDI31MX6 = C3*FDI41MX6 - FDI53MX6*S3;
FDI33MX6 = C3*FDI53MX6 + FDI41MX6*S3;
N21MX6 = C3*N31MX6 - 0.394*FDI33MX6 - N43MX6*S3;
N23MX6 = C3*N43MX6 + 0.394*FDI31MX6 + N31MX6*S3;
N13MX6 = C2*N33MX6 - N21MX6*S2;
FDI61MY6 = C6*U126 - S6*U226;
FDI63MY6 = -C6*U226 - S6*U126;
FDI51MY6 = C5*FDI61MY6 - S5*U326;
FDI53MY6 = C5*U326 + FDI61MY6*S5;
N41MY6 = C5*N53MX6 - 0.366*FDI53MY6 + S5*VP16;
N43MY6 = -C5*VP16 + 0.366*FDI51MY6 + N53MX6*S5;
FDI41MY6 = C4*FDI51MY6 + FDI63MY6*S4;
N31MY6 = C4*N41MY6 - N51MX6*S4;
N33MY6 = -C4*N51MX6 - N41MY6*S4;
FDI31MY6 = C3*FDI41MY6 - FDI53MY6*S3;
FDI33MY6 = C3*FDI53MY6 + FDI41MY6*S3;
N21MY6 = C3*N31MY6 - 0.394*FDI33MY6 - N43MY6*S3;
N23MY6 = C3*N43MY6 + 0.394*FDI31MY6 + N31MY6*S3;
N13MY6 = C2*N33MY6 - N21MY6*S2;
N61XX7 = C7*WP17 - DV37*S7;
N63XX7 = C7*DV37 + S7*WP17;
N51XX7 = C6*N61XX7 - DV27*S6;
N53XX7 = -C6*DV27 - N61XX7*S6;
N41XX7 = C5*N51XX7 - N63XX7*S5;
N43XX7 = C5*N63XX7 + N51XX7*S5;
N31XX7 = C4*N41XX7 + N53XX7*S4;
N33XX7 = C4*N53XX7 - N41XX7*S4;
N21XX7 = C3*N31XX7 - N43XX7*S3;
N23XX7 = C3*N43XX7 + N31XX7*S3;
N13XX7 = C2*N33XX7 - N21XX7*S2;
No71XY7 = -W17*W37 + WP27;
No72XY7 = W27*W37 + WP17;
No73XY7 = W17^2 - W27^2;
N61XY7 = C7*No71XY7 - No72XY7*S7;
N63XY7 = C7*No72XY7 + No71XY7*S7;
N51XY7 = C6*N61XY7 + No73XY7*S6;
N53XY7 = C6*No73XY7 - N61XY7*S6;
N41XY7 = C5*N51XY7 - N63XY7*S5;
N43XY7 = C5*N63XY7 + N51XY7*S5;
N31XY7 = C4*N41XY7 + N53XY7*S4;
N33XY7 = C4*N53XY7 - N41XY7*S4;
N21XY7 = C3*N31XY7 - N43XY7*S3;
N23XY7 = C3*N43XY7 + N31XY7*S3;
N13XY7 = C2*N33XY7 - N21XY7*S2;
No71XZ7 = W17*W27 + WP37;
No72XZ7 = -W17^2 + W37^2;
No73XZ7 = -W27*W37 + WP17;
N61XZ7 = C7*No71XZ7 - No72XZ7*S7;
N63XZ7 = C7*No72XZ7 + No71XZ7*S7;
N51XZ7 = C6*N61XZ7 + No73XZ7*S6;
N53XZ7 = C6*No73XZ7 - N61XZ7*S6;
N41XZ7 = C5*N51XZ7 - N63XZ7*S5;
N43XZ7 = C5*N63XZ7 + N51XZ7*S5;
N31XZ7 = C4*N41XZ7 + N53XZ7*S4;
N33XZ7 = C4*N53XZ7 - N41XZ7*S4;
N21XZ7 = C3*N31XZ7 - N43XZ7*S3;
N23XZ7 = C3*N43XZ7 + N31XZ7*S3;
N13XZ7 = C2*N33XZ7 - N21XZ7*S2;
No71YZ7 = W27^2 - W37^2;
No72YZ7 = -W17*W27 + WP37;
No73YZ7 = W17*W37 + WP27;
N61YZ7 = C7*No71YZ7 - No72YZ7*S7;
N63YZ7 = C7*No72YZ7 + No71YZ7*S7;
N51YZ7 = C6*N61YZ7 + No73YZ7*S6;
N53YZ7 = C6*No73YZ7 - N61YZ7*S6;
N41YZ7 = C5*N51YZ7 - N63YZ7*S5;
N43YZ7 = C5*N63YZ7 + N51YZ7*S5;
N31YZ7 = C4*N41YZ7 + N53YZ7*S4;
N33YZ7 = C4*N53YZ7 - N41YZ7*S4;
N21YZ7 = C3*N31YZ7 - N43YZ7*S3;
N23YZ7 = C3*N43YZ7 + N31YZ7*S3;
N13YZ7 = C2*N33YZ7 - N21YZ7*S2;
N61ZZ7 = C7*DV57 + DV37*S7;
N63ZZ7 = -C7*DV37 + DV57*S7;
N51ZZ7 = C6*N61ZZ7 + S6*WP37;
N53ZZ7 = C6*WP37 - N61ZZ7*S6;
N41ZZ7 = C5*N51ZZ7 - N63ZZ7*S5;
N43ZZ7 = C5*N63ZZ7 + N51ZZ7*S5;
N31ZZ7 = C4*N41ZZ7 + N53ZZ7*S4;
N33ZZ7 = C4*N53ZZ7 - N41ZZ7*S4;
N21ZZ7 = C3*N31ZZ7 - N43ZZ7*S3;
N23ZZ7 = C3*N43ZZ7 + N31ZZ7*S3;
N13ZZ7 = C2*N33ZZ7 - N21ZZ7*S2;
FDI71MX7 = C7*U117 - S7*U217;
FDI73MX7 = C7*U217 + S7*U117;
N61MX7 = -0.2503*FDI73MX7 - S7*VSP27;
N63MX7 = C7*VSP27 + 0.2503*FDI71MX7;
FDI61MX7 = C6*FDI71MX7 + S6*U317;
FDI63MX7 = C6*U317 - FDI71MX7*S6;
N51MX7 = C6*N61MX7 + S6*VP27;
N53MX7 = C6*VP27 - N61MX7*S6;
FDI51MX7 = C5*FDI61MX7 - FDI73MX7*S5;
FDI53MX7 = C5*FDI73MX7 + FDI61MX7*S5;
N41MX7 = C5*N51MX7 - 0.366*FDI53MX7 - N63MX7*S5;
N43MX7 = C5*N63MX7 + 0.366*FDI51MX7 + N51MX7*S5;
FDI41MX7 = C4*FDI51MX7 + FDI63MX7*S4;
N31MX7 = C4*N41MX7 + N53MX7*S4;
N33MX7 = C4*N53MX7 - N41MX7*S4;
FDI31MX7 = C3*FDI41MX7 - FDI53MX7*S3;
FDI33MX7 = C3*FDI53MX7 + FDI41MX7*S3;
N21MX7 = C3*N31MX7 - 0.394*FDI33MX7 - N43MX7*S3;
N23MX7 = C3*N43MX7 + 0.394*FDI31MX7 + N31MX7*S3;
N13MX7 = C2*N33MX7 - N21MX7*S2;
FDI71MY7 = C7*U127 - S7*U227;
FDI73MY7 = C7*U227 + S7*U127;
N61MY7 = -C7*VSP27 - 0.2503*FDI73MY7;
N63MY7 = 0.2503*FDI71MY7 - S7*VSP27;
FDI61MY7 = C6*FDI71MY7 + S6*U327;
FDI63MY7 = C6*U327 - FDI71MY7*S6;
N51MY7 = C6*N61MY7 - S6*VP17;
N53MY7 = -C6*VP17 - N61MY7*S6;
FDI51MY7 = C5*FDI61MY7 - FDI73MY7*S5;
FDI53MY7 = C5*FDI73MY7 + FDI61MY7*S5;
N41MY7 = C5*N51MY7 - 0.366*FDI53MY7 - N63MY7*S5;
N43MY7 = C5*N63MY7 + 0.366*FDI51MY7 + N51MY7*S5;
FDI41MY7 = C4*FDI51MY7 + FDI63MY7*S4;
N31MY7 = C4*N41MY7 + N53MY7*S4;
N33MY7 = C4*N53MY7 - N41MY7*S4;
FDI31MY7 = C3*FDI41MY7 - FDI53MY7*S3;
FDI33MY7 = C3*FDI53MY7 + FDI41MY7*S3;
N21MY7 = C3*N31MY7 - 0.394*FDI33MY7 - N43MY7*S3;
N23MY7 = C3*N43MY7 + 0.394*FDI31MY7 + N31MY7*S3;
N13MY7 = C2*N33MY7 - N21MY7*S2;

if friction_model
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
else
    regression_matrix = [
    %ZZR1 XXR2   XY2     XZ2     YZ2     ZZR2   MX2  MYR2  XXR3   XY3     XZ3     YZ3     ZZR3   MX3    MYR3   XXR4   XY4     XZ4     YZ4     ZZR4   MX4    MYR4    XXR5   XY5     XZ5     YZ5     ZZR5   MX5    MYR5   XXR6   XY6     XZ6     YZ6     ZZR6   MX6    MYR6    XXR7   XY7     XZ7     YZ7     ZZR7   MX7    MYR7   
    QDP1 N13XX2 N13XY2  N13XZ2  N13YZ2  N13ZZ2 0    0     N13XX3 N13XY3  N13XZ3  N13YZ3  N13ZZ3 N13MX3 N13MY3 N13XX4 N13XY4  N13XZ4  N13YZ4  N13ZZ4 N13MX4 N13MY4  N13XX5 N13XY5  N13XZ5  N13YZ5  N13ZZ5 N13MX5 N13MY5 N13XX6 N13XY6  N13XZ6  N13YZ6  N13ZZ6 N13MX6 N13MY6  N13XX7 N13XY7  N13XZ7  N13YZ7  N13ZZ7 N13MX7 N13MY7;
    0    -DV22  No23XY2 No23XZ2 No23YZ2 QDP2   VP22 -VP12 N23XX3 N23XY3  N23XZ3  N23YZ3  N23ZZ3 N23MX3 N23MY3 N23XX4 N23XY4  N23XZ4  N23YZ4  N23ZZ4 N23MX4 N23MY4  N23XX5 N23XY5  N23XZ5  N23YZ5  N23ZZ5 N23MX5 N23MY5 N23XX6 N23XY6  N23XZ6  N23YZ6  N23ZZ6 N23MX6 N23MY6  N23XX7 N23XY7  N23XZ7  N23YZ7  N23ZZ7 N23MX7 N23MY7;
    0    0      0       0       0       0      0    0     -DV23  No33XY3 No33XZ3 No33YZ3 WP33   VP23   -VP13  N33XX4 N33XY4  N33XZ4  N33YZ4  N33ZZ4 N33MX4 -N31MX4 N33XX5 N33XY5  N33XZ5  N33YZ5  N33ZZ5 N33MX5 N33MY5 N33XX6 N33XY6  N33XZ6  N33YZ6  N33ZZ6 N33MX6 N33MY6  N33XX7 N33XY7  N33XZ7  N33YZ7  N33ZZ7 N33MX7 N33MY7;
    0    0      0       0       0       0      0    0     0      0       0       0       0      0      0      -DV24  No43XY4 No43XZ4 No43YZ4 WP34   VP24   -VP14   N43XX5 N43XY5  N43XZ5  N43YZ5  N43ZZ5 N43MX5 N43MY5 N43XX6 N43XY6  N43XZ6  N43YZ6  N43ZZ6 N43MX6 N43MY6  N43XX7 N43XY7  N43XZ7  N43YZ7  N43ZZ7 N43MX7 N43MY7;
    0    0      0       0       0       0      0    0     0      0       0       0       0      0      0      0      0       0       0       0      0      0       -DV25  No53XY5 No53XZ5 No53YZ5 WP35   VP25   -VP15  N53XX6 N53XY6  N53XZ6  N53YZ6  N53ZZ6 N53MX6 -N51MX6 N53XX7 N53XY7  N53XZ7  N53YZ7  N53ZZ7 N53MX7 N53MY7;
    0    0      0       0       0       0      0    0     0      0       0       0       0      0      0      0      0       0       0       0      0      0       0      0       0       0       0      0      0      -DV26  No63XY6 No63XZ6 No63YZ6 WP36   VP26   -VP16   N63XX7 N63XY7  N63XZ7  N63YZ7  N63ZZ7 N63MX7 N63MY7;
    0    0      0       0       0       0      0    0     0      0       0       0       0      0      0      0      0       0       0       0      0      0       0      0       0       0       0      0      0      0      0       0       0       0      0      0       -DV27  No73XY7 No73XZ7 No73YZ7 WP37   VP27   -VP17 ;
    ];
end
end

