
function [L, D] = lift_drag(rho, V, S, CL, CD)

% Computes aerodynamic forces using standard lift & drag equations
% Inputs:
% rho → Air density (kg/m^3)
% V   → Velocity (m/s)
% S   → Wing reference area (m^2)
% CL  → Lift coefficient
% CD  → Drag coefficient

q = 0.5 * rho .* V.^2;    % Dynamic pressure

L = q .* S .* CL;         % Lift force (N)
D = q .* S .* CD;         % Drag force (N)

end
