function [c, ceq] = Optimize_constraints_first_step(parameters)
% 物理约束参考文献：
% Parameter Identification of the KUKA LBR iiwa Robot Including
% Constrainsts on Physical Feasibility
% 文章链接：https://www.sciencedirect.com/science/article/pii/S2405896317317147

m1 = parameters(1);   m2 = parameters(2);   m3 = parameters(3);   m4 = parameters(4);   m5 = parameters(5);   m6 = parameters(6);   m7 = parameters(7);
I1xx = parameters(8); I1xy = parameters(9); I1xz = parameters(10); I1yy = parameters(11); I1yz = parameters(12); I1zz = parameters(13); lc1x = parameters(14); lc1y = parameters(15); lc1z = parameters(16);
I2xx = parameters(17); I2xy = parameters(18); I2xz = parameters(19); I2yy = parameters(20); I2yz = parameters(21); I2zz = parameters(22); lc2x = parameters(23); lc2y = parameters(24); lc2z = parameters(25);
I3xx = parameters(26); I3xy = parameters(27); I3xz = parameters(28); I3yy = parameters(29); I3yz = parameters(30); I3zz = parameters(31); lc3x = parameters(32); lc3y = parameters(33); lc3z = parameters(34);
I4xx = parameters(35); I4xy = parameters(36); I4xz = parameters(37); I4yy = parameters(38); I4yz = parameters(39); I4zz = parameters(40); lc4x = parameters(41); lc4y = parameters(42); lc4z = parameters(43);
I5xx = parameters(44); I5xy = parameters(45); I5xz = parameters(46); I5yy = parameters(47); I5yz = parameters(48); I5zz = parameters(49); lc5x = parameters(50); lc5y = parameters(51); lc5z = parameters(52);
I6xx = parameters(53); I6xy = parameters(54); I6xz = parameters(55); I6yy = parameters(56); I6yz = parameters(57); I6zz = parameters(58); lc6x = parameters(59); lc6y = parameters(60); lc6z = parameters(61);
I7xx = parameters(62); I7xy = parameters(63); I7xz = parameters(64); I7yy = parameters(65); I7yz = parameters(66); I7zz = parameters(67); lc7x = parameters(68); lc7y = parameters(69); lc7z = parameters(70);
mi = [m1, m2, m3, m4, m5, m6, m7]';

I1 = [I1xx I1xy I1xz; I1xy I1yy I1yz; I1xz I1yz I1zz];
D1 = eig(I1);
I2 = [I2xx I2xy I2xz; I2xy I2yy I2yz; I2xz I2yz I2zz];
D2 = eig(I2);
I3 = [I3xx I3xy I3xz; I3xy I3yy I3yz; I3xz I3yz I3zz];
D3 = eig(I3);
I4 = [I4xx I4xy I4xz; I4xy I4yy I4yz; I4xz I4yz I4zz];
D4 = eig(I4);
I5 = [I5xx I5xy I5xz; I5xy I5yy I5yz; I5xz I5yz I5zz];
D5 = eig(I5);
I6 = [I6xx I6xy I6xz; I6xy I6yy I6yz; I6xz I6yz I6zz];
D6 = eig(I6);
I7 = [I7xx I7xy I7xz; I7xy I7yy I7yz; I7xz I7yz I7zz];
D7 = eig(I7);

matrix_eig = [D1; D2; D3; D4; D5; D6; D7];

physical_constraints1 = [[I1zz I1yy I1xx]' - [I1xx + I1yy, I1xx + I1zz, I1yy + I1zz]';
                         [I2zz I2yy I2xx]' - [I2xx + I2yy, I2xx + I2zz, I2yy + I2zz]';
                         [I3zz I3yy I3xx]' - [I3xx + I3yy, I3xx + I3zz, I3yy + I3zz]';
                         [I4zz I4yy I4xx]' - [I4xx + I4yy, I4xx + I4zz, I4yy + I4zz]';
                         [I5zz I5yy I5xx]' - [I5xx + I5yy, I5xx + I5zz, I5yy + I5zz]';
                         [I6zz I6yy I6xx]' - [I6xx + I6yy, I6xx + I6zz, I6yy + I6zz]';
                         [I7zz I7yy I7xx]' - [I7xx + I7yy, I7xx + I7zz, I7yy + I7zz]'];
physical_constraints2 = [max([I1xx I1yy I1zz]) - 100 * min([I1xx I1yy I1zz]);
                         max([I2xx I2yy I2zz]) - 100 * min([I2xx I2yy I2zz]);
                         max([I3xx I3yy I3zz]) - 100 * min([I3xx I3yy I3zz]);
                         max([I4xx I4yy I4zz]) - 100 * min([I4xx I4yy I4zz]);
                         max([I5xx I5yy I5zz]) - 100 * min([I5xx I5yy I5zz]);
                         max([I6xx I6yy I6zz]) - 100 * min([I6xx I6yy I6zz]);
                         max([I7xx I7yy I7zz]) - 100 * min([I7xx I7yy I7zz])];
physical_constraints3 = [3 * [I1zz I2yy]' - [min([I1xx I1yy]) min([I2xx, I2zz])]';
                         3 * [I1zz I4yy]' - [min([I1xx I1yy]) min([I4xx, I4zz])]';
                         3 * [I3zz I2yy]' - [min([I3xx I3yy]) min([I2xx, I2zz])]';
                         3 * [I3zz I4yy]' - [min([I3xx I3yy]) min([I4xx, I4zz])]';
                         3 * [I5zz I2yy]' - [min([I5xx I5yy]) min([I2xx, I2zz])]';
                         3 * [I5zz I4yy]' - [min([I5xx I5yy]) min([I4xx, I4zz])]'];
physical_constraints4 = [max([abs(I1xy) abs(I1xz) abs(I1yz)]) - 0.1 * abs(min([I1xx I1yy I1zz]));
                         max([abs(I2xy) abs(I2xz) abs(I2yz)]) - 0.1 * abs(min([I2xx I2yy I2zz]));
                         max([abs(I3xy) abs(I3xz) abs(I3yz)]) - 0.1 * abs(min([I3xx I3yy I3zz]));
                         max([abs(I4xy) abs(I4xz) abs(I4yz)]) - 0.1 * abs(min([I4xx I4yy I4zz]));
                         max([abs(I5xy) abs(I5xz) abs(I5yz)]) - 0.1 * abs(min([I5xx I5yy I5zz]));
                         max([abs(I6xy) abs(I6xz) abs(I6yz)]) - 0.1 * abs(min([I6xx I6yy I6zz]));
                         max([abs(I7xy) abs(I7xz) abs(I7yz)]) - 0.1 * abs(min([I7xx I7yy I7zz]))];
physical_constraints5 = [[1e-4 1e-4 1e-4]' - [I1xx I1yy I1zz]';
                         [1e-4 1e-4 1e-4]' - [I2xx I2yy I2zz]';
                         [1e-4 1e-4 1e-4]' - [I3xx I3yy I3zz]';
                         [1e-4 1e-4 1e-4]' - [I4xx I4yy I4zz]';
                         [1e-4 1e-4 1e-4]' - [I5xx I5yy I5zz]';
                         [1e-4 1e-4 1e-4]' - [I6xx I6yy I6zz]';
                         [1e-4 1e-4 1e-4]' - [I7xx I7yy I7zz]'];

c = [-mi; -matrix_eig; physical_constraints1; physical_constraints2; physical_constraints3; physical_constraints4; physical_constraints5];
ceq = zeros(size(c));
end
