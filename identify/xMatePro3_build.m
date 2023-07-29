% 标准型
%         [theta  d      a alpha]
Ls1 = Link([0      0.3415 0 -pi/2], 'standard');
Ls2 = Link([0      0      0 pi/2 ], 'standard');
Ls3 = Link([0      0.394  0 -pi/2], 'standard');
Ls4 = Link([0      0      0 pi/2 ], 'standard');
Ls5 = Link([0      0.366  0 -pi/2], 'standard');
Ls6 = Link([0      0      0 pi/2 ], 'standard');
Ls7 = Link([0      0.2503 0 0    ], 'standard');

% 整合各个关节
xMatePro3_standard = SerialLink([Ls1 Ls2 Ls3 Ls4 Ls5 Ls6 Ls7]);
xMatePro3_standard.name = 'xMatePro3_standard';
xMatePro3_standard.manufacturer = 'ROKEA';

% ----
% 改进型
%         [theta  d      a alpha]
Lm1 = Link([0      0.3415 0 0    ], 'modified');
Lm2 = Link([0      0      0 -pi/2], 'modified');
Lm3 = Link([0      0.394  0 pi/2 ], 'modified');
Lm4 = Link([0      0      0 -pi/2], 'modified');
Lm5 = Link([0      0.366  0 pi/2 ], 'modified');
Lm6 = Link([0      0      0 -pi/2], 'modified');
Lm7 = Link([0      0.2503 0 pi/2 ], 'modified');

% 整合各个关节
xMatePro3_modified = SerialLink([Lm1 Lm2 Lm3 Lm4 Lm5 Lm6 Lm7]);
xMatePro3_modified.name = 'xMatePro3_modified';
xMatePro3_modified.manufacturer = 'ROKEA';
