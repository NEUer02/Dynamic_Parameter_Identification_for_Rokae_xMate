function [friction] = compute_Stribeck(qd)

friction(1, 1) = sign(qd(1)) * (fc1 + (fs1 - fc1) * exp(-1 * abs(qd(1) / vs1) * gamma)) + fv1 * qd(1);
friction(2, 1) = sign(qd(2)) * (fc2 + (fs2 - fc2) * exp(-1 * abs(qd(2) / vs2) * gamma)) + fv2 * qd(2);
friction(3, 1) = sign(qd(3)) * (fc3 + (fs3 - fc3) * exp(-1 * abs(qd(3) / vs3) * gamma)) + fv3 * qd(3);
friction(4, 1) = sign(qd(4)) * (fc4 + (fs4 - fc4) * exp(-1 * abs(qd(4) / vs4) * gamma)) + fv4 * qd(4);
friction(5, 1) = sign(qd(5)) * (fc5 + (fs5 - fc5) * exp(-1 * abs(qd(5) / vs5) * gamma)) + fv5 * qd(5);
friction(6, 1) = sign(qd(6)) * (fc6 + (fs6 - fc6) * exp(-1 * abs(qd(6) / vs6) * gamma)) + fv6 * qd(6);
friction(7, 1) = sign(qd(7)) * (fc7 + (fs7 - fc7) * exp(-1 * abs(qd(7) / vs7) * gamma)) + fv7 * qd(7);
end

