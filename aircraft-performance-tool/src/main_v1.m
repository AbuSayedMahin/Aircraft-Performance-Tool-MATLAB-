clc; clear; close all;

% Aircraft Parameters.
S  = 30;           % Wing area (m^2)
CD0 = 0.02;          % Zero-lift drag coefficient
AR  = 8;             % Aspect ratio (assumed)
e   = 0.8;           % Oswald efficiency factor
k   = 1/(pi*AR*e);



% Flight Conditions.
h = 2000;          % Altitude (m)
V = linspace(30,120,50);   % Velocity range (m/s)


% Atmosphere.
[T, P, rho] = isa_atmosphere(h);

% Aerodynamics.
W = 60000;   %  weight 

CL = W ./ (0.5 * rho .* V.^2 * S);     % Lift coefficient from physics
CD = CD0 + k * CL.^2;                  % Drag polar

[L, D] = lift_drag(rho, V, S, CL, CD); 
Treq = thrust_required(D);


%% ----------------- Plot Thrust & Power Required -----------------

figure('Color','w','Position',[100 100 820 520]);
tiledlayout(1,2,'TileSpacing','compact','Padding','compact');

% LEFT: Thrust Required
nexttile; hold on;

altitudes = [0, 2000, 5000];
styles = {'-','--','-.'};

for i = 1:length(altitudes)
    [~,~,rho_i] = isa_atmosphere(altitudes(i));
    
    CL_i = W ./ (0.5 * rho_i .* V.^2 * S);  % Lift coefficient
    CD_i = CD0 + k * CL_i.^2;               % Drag polar
    
    [~, D_i] = lift_drag(rho_i, V, S, CL_i, CD_i);
    Treq_i = thrust_required(D_i);
    
    plot(V, Treq_i,'LineWidth',2.2,'LineStyle',styles{i});
    
    [Tmin, idx] = min(Treq_i);
    plot(V(idx), Tmin,'o','MarkerSize',6,'LineWidth',1.2);
end

xlabel('Velocity (m/s)','FontWeight','bold');
ylabel('Thrust Required (N)','FontWeight','bold');
title('Thrust Required vs Velocity','FontWeight','bold');
legend('SL','Min SL','2000 m','Min 2000 m','5000 m','Min 5000 m','Location','northwest');
grid on;
set(gca,'FontSize',12,'LineWidth',1.2);

% RIGHT: Power Required
nexttile; hold on;

[~,~,rho_sl] = isa_atmosphere(0);  % Sea level focus
CL_sl = W ./ (0.5 * rho_sl .* V.^2 * S);
CD_sl = CD0 + k * CL_sl.^2;

[~, D_sl] = lift_drag(rho_sl, V, S, CL_sl, CD_sl);
Treq_sl = thrust_required(D_sl);
Preq = Treq_sl .* V;

plot(V, Preq,'LineWidth',2.5);

[Pmin, idxP] = min(Preq);
V_endurance = V(idxP);

plot(V_endurance, Pmin,'r*','MarkerSize',10,'LineWidth',1.5);
text(V_endurance, Pmin, sprintf('  Best Endurance Speed = %.1f m/s',V_endurance),'FontSize',10);

xlabel('Velocity (m/s)','FontWeight','bold');
ylabel('Power Required (W)','FontWeight','bold');
title('Power Required & Endurance Condition','FontWeight','bold');
grid on;
set(gca,'FontSize',12,'LineWidth',1.2);

% Save high-quality output
outputFolder = '../figures';
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

exportgraphics(gcf, fullfile(outputFolder, 'aircraft_performance_final.png'),'Resolution',300);

%% ----------------- Plot Drag Polar -----------------

% Create a new figure for drag polar
figure('Color','w','Position',[100 100 600 400]);

plot(CL_sl, CD_sl, 'LineWidth',2);
grid on;
xlabel('Lift Coefficient (C_L)','FontWeight','bold');
ylabel('Drag Coefficient (C_D)','FontWeight','bold');
title('Aircraft Drag Polar','FontWeight','bold');
set(gca,'FontSize',12,'LineWidth',1.2);
box on

% Save Drag Polar figure
exportgraphics(gcf, fullfile(outputFolder, 'drag_polar.png'),'Resolution',300);
