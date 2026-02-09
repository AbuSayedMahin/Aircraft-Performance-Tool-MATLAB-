
function [T, P, rho] = isa_atmosphere(h)
% ISA atmosphere model up to 11 km

T0 = 288.15;       % K
P0 = 101325;       % Pa
L  = 0.0065;       % K/m
R  = 287;          % J/kgK
g  = 9.81;         % m/s^2

  T = T0 - L*h;
 P  = P0 * (T/T0)^(g/(R*L));
rho = P / (R*T);
end

