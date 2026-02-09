
function [L, D] = lift_drag(rho, V, S, CL, CD)
L = 0.5 * rho .* V.^2 * S * CL;
D = 0.5 * rho .* V.^2 * S * CD;
end
